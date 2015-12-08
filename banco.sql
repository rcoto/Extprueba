
DROP TABLE IF EXISTS banco;
CREATE DATABASE  banco DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE banco;
CREATE TABLE cliente (
  id serial primary key,
  nombre tinytext NOT NULL
);

CREATE TABLE cuenta (
  id serial primary key,
  cliente_id bigint unsigned NOT NULL ,
  saldo decimal(10,2) DEFAULT '0.00',
  foreign key (cliente_id) references cliente (id)
);

CREATE TABLE transaccion (
  id serial primary key,
  cuenta_id bigint unsigned NOT NULL,
  descripcion tinytext NOT NULL,
  cantidad decimal(10,2) NOT NULL,
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  foreign key (cuenta_id) references cuenta (id)
);
