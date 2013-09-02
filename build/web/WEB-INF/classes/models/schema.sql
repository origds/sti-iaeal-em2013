DROP SCHEMA "STI" CASCADE;

CREATE SCHEMA "STI"
AUTHORIZATION postgres;

GRANT ALL ON SCHEMA "STI" TO stidb;

-- Tabla: "STI".usuario

CREATE TABLE "STI".usuario
(
  usuario VARCHAR(15) NOT NULL,
  contrasena VARCHAR(128) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  correo VARCHAR(40) NOT NULL,
  administrador BOOLEAN NOT NULL DEFAULT FALSE,
  ultimaSesion TIMESTAMP NOT NULL
)
WITH (
OIDS=FALSE
);

-- Table: "STI".tratado 

CREATE TABLE "STI".tratado
(
  id SERIAL,
  titulo VARCHAR(800) NOT NULL,
  clasificacion BOOLEAN NOT NULL DEFAULT FALSE,
  aprobado BOOLEAN NOT NULL DEFAULT FALSE,
  firmaLugar VARCHAR(140),
  firmaFecha DATE,
  numGaceta VARCHAR(20),
  fechaGaceta DATE,
  canjeNotificacion DATE,
  deposito BOOLEAN DEFAULT FALSE,
  fechaDeposito DATE,
  entradaVigor DATE,
  duracion VARCHAR(120),
  periodo NUMERIC(4),
  volumen NUMERIC(4),
  pagina NUMERIC(4),
  observacion VARCHAR(320),
  contenido TEXT,
  status NUMERIC(1) NOT NULL,
  usuarioT VARCHAR(15) NOT NULL
)
WITH (
OIDS=FALSE
);

-- Table: "STI".pais

CREATE TABLE "STI".pais
(
  idTP INT,
  pais VARCHAR(50) NOT NULL
)
WITH (
OIDS=FALSE
);

-- Table: "STI".grupo 

CREATE TABLE "STI".grupo
(
  idTG INT,
  grupo VARCHAR(100) NOT NULL
)
WITH (
OIDS=FALSE
);

-- Table: "STI".log guarda logs

CREATE TABLE "STI".log
(
  nombreUser VARCHAR(15) NOT NULL,
  tipoUser VARCHAR(35),
  accion VARCHAR(100) NOT NULL,
  campoBusqueda VARCHAR(800),
  tituloTratado VARCHAR(800),
  fechaHora VARCHAR(50) NOT NULL
)
WITH (
OIDS=FALSE
);

-- Alter Table Usuario

ALTER TABLE "STI".usuario ADD CONSTRAINT "PK_nombre_usuario" PRIMARY KEY (usuario);

ALTER TABLE "STI".usuario ADD CONSTRAINT "restriccion_email" CHECK (correo ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-za-z]+$');

ALTER TABLE "STI".usuario ADD CONSTRAINT "restriccion_contrasena" CHECK (char_length(contrasena)>=6);

ALTER TABLE "STI".usuario ADD CONSTRAINT "restriccion_usuario" CHECK (char_length(usuario)>=1);

-- Alter Table Tratado

ALTER TABLE "STI".tratado ADD CONSTRAINT "PK_clave_tratado" PRIMARY KEY (id);

ALTER TABLE "STI".tratado ADD CONSTRAINT "FK_usuario_tratado" FOREIGN KEY (usuarioT) REFERENCES "STI".usuario;

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_periodo" CHECK (periodo>=0);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_volumen" CHECK (volumen>=0);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_pagina" CHECK (pagina>=0);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_firmaFecha" CHECK (firmaFecha<=current_date);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_fechaGaceta" CHECK (fechaGaceta<=current_date);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_canjeNotificacion" CHECK (canjeNotificacion<=current_date);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_fechaDeposito" CHECK (fechaDeposito<=current_date);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_entradaVigor" CHECK (entradaVigor<=current_date);

ALTER TABLE "STI".tratado ADD CONSTRAINT "restriccion_observacion" CHECK (observacion ~* '(^(ht|f)tps?:\/\/\w+([\.\-\w]+)?\.([a-z]{2,4}|travel)(:\d{2,5})?(\/.*)?$|)');

-- Alter Table Pais

ALTER TABLE "STI".pais ADD CONSTRAINT "PK_pais" PRIMARY KEY (idTP, pais);

ALTER TABLE "STI".pais ADD CONSTRAINT "FK_pais_tratado" FOREIGN KEY (idTP) REFERENCES "STI".tratado;

-- Alter Table Grupo

ALTER TABLE "STI".grupo ADD CONSTRAINT "PK_grupo" PRIMARY KEY (idTG, grupo);

ALTER TABLE "STI".grupo ADD CONSTRAINT "FK_grupo_tratado" FOREIGN KEY (idTG) REFERENCES "STI".tratado;

-- Alter Table Log

ALTER TABLE "STI".log ADD CONSTRAINT "PK_log" PRIMARY KEY (nombreuser, fechahora);

-- Extension que permite desacentuar palabras dentro de la base de datos
CREATE EXTENSION unaccent;