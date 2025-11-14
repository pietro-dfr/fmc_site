CREATE DATABASE IF NOT EXISTS ferreiras_material;
USE ferreiras_material;

-- ===============================
-- TABELA: ENDERECO
-- ===============================
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep VARCHAR(10) NOT NULL
);

-- ===============================
-- TABELA: CLIENTE
-- ===============================
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    tipo ENUM('PF','PJ') NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

-- ===============================
-- TABELA: CATEGORIA
-- ===============================
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

-- ===============================
-- TABELA: PRODUTO
-- ===============================
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    unidade VARCHAR(10) NOT NULL,  -- EX: KG, UN, PC, CX
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

-- ===============================
-- TABELA: ESTOQUE
-- ===============================
CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- ===============================
-- TABELA: VENDA
-- ===============================
CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- ===============================
-- TABELA: VENDA ITEM
-- ===============================
CREATE TABLE venda_item (
    id_venda_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unit DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
