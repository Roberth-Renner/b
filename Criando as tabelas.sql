
                                                             --    SCRIPT COM A CRIAÇÃO DAS TABELAS    --

show databases;
create database ecommerce;
use ecommerce;


-- REALIZEI ALGUMAS ALTERAÇÕES NO CÓDIGO, ALGUNS DADOS E TABELAS ADICIONAIS --

-- CRIANDO A TABELA DE CLIENTES --



create table Cliente(
    IdCliente int auto_increment primary key,
    Fnome varchar(10) not null,
    Mnome char(1) ,
    Lnome varchar(10) not null,
    Endereco varchar(255) not null,
    TipoDocumento ENUM('PF', 'PJ') not null,
    CPF char(11) unique,
    CNPJ char(14) unique,
    DataNascimento date not null
);


-- CRIANDO TABELA DE PAGAMENTO --

create table Pagamento(
    IdPagamento int auto_increment,
    IdCliente int,
    TipoPagamento enum('Cartao', 'Boleto', 'Pix', 'Pagamento nao realizado') default ('Pagamento nao realizado'),
    constraint primary key (IdPagamento, IdCliente),
    constraint fk_Cliente_Pagamento foreign key (IdCliente) references Cliente(IdCliente)
);

-- CRIANDO A TABELA PEDIDOS --

create table Pedidos(
    IdPedido int auto_increment primary key,
    IdCliente int,
    Descricao varchar(250),
    StatusPedido enum('Pedido realizado', 'Em andamento', 'Saiu para entrega', 'Finalizado', 'Esperando pagamento') default ('Esperando pagamento'),
    Frete float,
    CupomFrete boolean default 0,
    IdPagamento int,
    Quantidade int not null,
    PreçoUnidade float not null,
    constraint fk_Pagamento_Pedidos foreign key (IdPagamento) references Pagamento(IdPagamento),
    constraint fk_Cliente_Pedidos foreign key (IdCliente) references Cliente(IdCliente)
);

-- CRIANDO TABELA DE ENTREGA --

create table Entrega(
    IdEntrega int auto_increment,
    IdCliente int,
    IdPedido int,
    Estatus enum('Saiu para entrega', 'Entrega realizada', 'Preparando pedido') default ('Preparando pedido'),
    TipoDeEntrega enum('Urgencia', 'Normal') default ('Normal'),
    CodigoRastreio CHAR(10),
    constraint primary key (IdEntrega, IdCliente, IdPedido),
    constraint fk_Entrega_Pedido foreign key (IdPedido) references Pedidos(IdPedido),
    constraint fk_Entrega_Cliente foreign key (IdCliente) references Cliente(IdCliente)
);

-- CRIANDO TABELA DE PRODUTO --

create table Produto(
    IdProduto int auto_increment primary key,
    Categoria enum('Eletrônicos', 'Eletrodomésticos', 'Moveis', 'Alimentos', 'Utensilios'),
    ClassificacaoCrianca boolean,
    PNome varchar(30) not null,
    Avaliacao int check (Avaliacao >= 0 and Avaliacao <= 5),
    Pdimensao varchar(25)
);

-- CRIANDO TABELA DE ESTOQUE --

create table Estoque(
    IdEstoque int auto_increment primary key,
    Elocal varchar(250) not null,
    Ecategoria enum('Eletrônicos', 'Eletrodomésticos', 'Moveis', 'Alimentos', 'Utensilios') not null,
    Quantidade int not null
);

-- CRIANDO TABELA DE FORNECEDOR --

create table Fornecedor(
    IdFornecedor int auto_increment primary key,
    Flocal varchar(250) not null,
    CNPJ char(14) not null unique,
    RazaoSocial varchar(20) not null,
    Contato char(11) not null,
    AvaliacaoFornecedor int check(AvaliacaoFornecedor >= 0 and AvaliacaoFornecedor <= 5)
);


-- CRIANDO TABELA DE VENDEDOR --

create table Vendedor(
    IdVendedor int auto_increment primary key,
    Vlocal varchar(250) not null,
    CNPJ char(14) not null unique,
    RazaoSocial varchar(40) not null,
    Contato char(11) not null,
    NomeFantasia varchar(25),
    AvaliacaoVendedor int check(AvaliacaoVendedor >= 0 and AvaliacaoVendedor <= 5)
);

-- CRIANDO TABELAS DE RELAÇÃO PARA EFETUAR A SOLUÇÃO DAS RELAÇÕES M PARA N --

-- CRIANDO TABELA DA RELAÇÃO PRODUTO/VENDEDOR -- 

create table Relacao_Prod_Vend(
    IdRelacaoVend int auto_increment,
    IdProduto int,
    IdVendedor int,
    constraint primary key(IdRelacaoVend, IdProduto, IdVendedor),
    constraint fk_Vendedor_Produto foreign key (IdVendedor) references Vendedor(IdVendedor),
    constraint fk_Produto_Vendedor foreign key (IdProduto) references Produto(IdProduto) 
);

-- CRIANDO TABELA DA RELAÇÃO PRODUTO/FORNECEDOR --

create table Relacao_Prod_Forn(
    IdRelacaoForn int auto_increment,
    IdProduto int,
    IdFornecedor int,
    constraint primary key (IdRelacaoForn, IdProduto, IdFornecedor),
    constraint fk_Fornecedor_Produto foreign key (IdFornecedor) references Fornecedor(IdFornecedor),
    constraint fk_Produto_Fornecedor foreign key (IdProduto) references Produto(IdProduto) 
);

-- CRIANDO TABELA DA RELAÇÃO PRODUTO/ESTOQUE --

create table Relacao_Prod_Est(
    IdRelacaoEstoq int auto_increment,
    IdProduto int,
    IdEstoque int,
    constraint primary key (IdRelacaoEstoq, IdProduto, IdEstoque),
    constraint fk_Estoque_Produto foreign key (IdEstoque) references Estoque(IdEstoque),
    constraint fk_Produto_Estoque foreign key (IdProduto) references Produto(IdProduto) 
);

-- CRIANDO TABELA DA RELAÇÃO PRODUTO/PEDIDO --

create table Realacao_Prod_Pedid(
    IdRelacaoPedid int auto_increment,
    IdProduto int,
    IdPedido int,
    constraint primary key (IdRelacaoPedid, IdProduto, IdPedido),
    constraint fk_Pedido_Produto foreign key (IdPedido) references Pedidos(IdPedido),
    constraint fk_Produto_Pedido foreign key (IdProduto) references Produto(IdProduto) 
);
