-- Crear base de datos
CREATE DATABASE ReservaEspacios;

-- Tabla Roles (para control de permisos)
CREATE TABLE Roles (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    RolId INT NOT NULL REFERENCES Roles(Id),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Espacios
CREATE TABLE Espacios (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla EstadosReserva (para normalizar estados)
CREATE TABLE EstadosReserva (
    Id SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla Reservas
CREATE TABLE Reservas (
    Id SERIAL PRIMARY KEY,
    UsuarioId INT NOT NULL REFERENCES Usuarios(Id),
    EspacioId INT NOT NULL REFERENCES Espacios(Id),
    EstadoId INT NOT NULL REFERENCES EstadosReserva(Id),
    FechaInicio TIMESTAMP NOT NULL,
    FechaFin TIMESTAMP NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_fechas CHECK (FechaFin > FechaInicio)
);

-- Índices para optimizar consultas
CREATE INDEX idx_usuario_email ON Usuarios(Email);
CREATE INDEX idx_reserva_fecha ON Reservas(FechaInicio, FechaFin);
CREATE INDEX idx_espacio_nombre ON Espacios(Nombre);

-- Datos iniciales para Roles y EstadosReserva
INSERT INTO Roles (Nombre) VALUES ('Admin'), ('Usuario');
INSERT INTO EstadosReserva (Nombre) VALUES ('Pendiente'), ('Confirmada'), ('Cancelada');