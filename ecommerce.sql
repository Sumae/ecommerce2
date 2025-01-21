-- Criação de banco de dados
CREATE DATABASE IF NOT EXISTS e_commerce;
USE e_commerce;

-- Criar tabela cliente
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Minit CHAR(1),
    CPF CHAR(11) NOT NULL UNIQUE,
    Address VARCHAR(100)
);

-- Criar tabela produto
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    classification_kids BOOLEAN DEFAULT FALSE,
    category ENUM('Eletronico', 'Vestimento', 'Brinquedos', 'Alimentos', 'Imoveis') NOT NULL,
    avaliacao FLOAT DEFAULT 0 CHECK (avaliacao BETWEEN 0 AND 5),
    size VARCHAR(20)
);

-- Criar tabela pagamento
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões'),
    limitAvailable FLOAT,
    FOREIGN KEY (idClient) REFERENCES cliente(idCliente)
);

-- Criar tabela pedido
CREATE TABLE orders (
    idOrders INT AUTO_INCREMENT PRIMARY KEY,
    idOrdersClient INT NOT NULL,
    ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') NOT NULL,
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idOrdersClient) REFERENCES cliente(idCliente)
);

-- Criar tabela para associar pedidos e produtos
CREATE TABLE pedido_produto (
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (idPedido, idProduto),
    FOREIGN KEY (idPedido) REFERENCES orders(idOrders),
    FOREIGN KEY (idProduto) REFERENCES product(idProduct)
);

use e_commerce;
select * from cliente;
-- drop table produto;
-- drop table pagamento;
-- drop table pedido_produto;
