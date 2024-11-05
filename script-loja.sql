create database loja;

use loja;

create table cliente (
codigo_cliente smallint not null auto_increment, 
nome_cliente char(20),
endereco char(30),   
cidade char(15),
cep char(08),
uf char(02),
constraint pk_cliente primary key (codigo_cliente)
);

create table vendedor (
codigo_vendedor smallint not null auto_increment,
nome_vendedor char(20), 
salario_fixo float,
faixa_comissao char(01),
constraint pk_vendedor primary key (codigo_vendedor)
); 

create table produto (
codigo_produto  smallint not null auto_increment,
unidade char(03),
descricao_produto char(30), 
val_unit float,
constraint pk_produto primary key (codigo_produto)
);

create table pedido (
num_pedido integer not null auto_increment, 
prazo_entrega smallint not null, 
codigo_vendedor smallint not null,
codigo_cliente smallint not null,
constraint pk_pedido primary key (num_pedido),
constraint fk_vendedor foreign key (codigo_vendedor) references vendedor(codigo_vendedor),
constraint fk_cliente foreign key (codigo_cliente) references cliente(codigo_cliente)
);

create table item_do_Pedido (
num_pedido integer not null auto_increment,
quantidade  decimal,
codigo_produto smallint not null,
codigo_vendedor smallint not null,
constraint pk_pedido_prod primary key (num_pedido,codigo_produto),
constraint fk_produto foreign key (codigo_produto) references produto(codigo_produto),
constraint fk_vendedor_pedido foreign key (codigo_vendedor) references vendedor(codigo_vendedor)
);

insert into cliente (nome_cliente, endereco, cidade, cep, uf) 
values ("Cláudio", "Rua da Floresta, 40", "Sarandi", "58000000", "AM");

insert into cliente  
values (2, "Roberto", "Rua da Floresta, 40", "Sarandi", "58000000", "AM");

insert into cliente (nome_cliente, endereco, cidade, cep, uf) 
values ("Antonia", "Rua Floriano Peixoto, 200", "Campina Grande", "58100000", "PB");

insert into cliente (nome_cliente, endereco, cidade, cep, uf) 
values ("Pablo", "Rua de Recife, 300", "Recife", "58200000", "PE");

insert into vendedor (nome_vendedor, salario_fixo, faixa_comissao) 
values ("Luciana", 2.300, "2");

insert into vendedor (nome_vendedor, salario_fixo, faixa_comissao) 
values ("Geraldo", 2.300, "2");

insert into vendedor (nome_vendedor, salario_fixo, faixa_comissao) 
values ("Renato", 2.300, null);

insert into vendedor (nome_vendedor, salario_fixo, faixa_comissao) 
values ("Joana", 4.300, "1");

insert into vendedor (nome_vendedor, salario_fixo, faixa_comissao) 
values ("Enzo", 1.500, "5");

insert into produto (unidade, descricao_produto, val_unit) 
values (5, "Pizza Muçarela", 57.00);

insert into produto (unidade, descricao_produto, val_unit) 
values (5, "Pizza Calabresa", 64.00);

insert into produto (unidade, descricao_produto, val_unit) 
values (5, "Frango com Bacon", 65.90);

insert into produto (unidade, descricao_produto, val_unit) 
values (1, "Pizza Marguerita", 55.00);

insert into produto (unidade, descricao_produto, val_unit) 
values (1, "Pizza Palmito", 60.00);

insert into pedido (prazo_entrega, codigo_vendedor, codigo_cliente) 
values (5, 1, 2);

insert into pedido (prazo_entrega, codigo_vendedor, codigo_cliente) 
values (3, 2, 1);

insert into pedido (prazo_entrega, codigo_vendedor, codigo_cliente) 
values (2, 4, 3);

insert into pedido (prazo_entrega, codigo_vendedor, codigo_cliente) 
values (4, 5, 4);

insert into item_do_Pedido (quantidade, codigo_produto, codigo_vendedor) 
values (2, 1, 1);

insert into item_do_Pedido (quantidade, codigo_produto, codigo_vendedor) 
values (1, 2, 2);

insert into item_do_Pedido (quantidade, codigo_produto, codigo_vendedor) 
values (3, 2, 2);

insert into item_do_Pedido (quantidade, codigo_produto, codigo_vendedor) 
values (3, 3, 4);

update produto set val_unit = 59.00 
where descricao_produto = "Pizza Muçarela";

select * from produto;


delete from vendedor 
where faixa_comissao is null;

delete from vendedor 
where faixa_comissao = null;

select descricao_produto, unidade, val_unit 
from produto;

select nome_cliente, endereco 
from cliente;

select descricao_produto, val_unit 
from produto
where codigo_produto = 1;

select salario_fixo, faixa_comissao
from vendedor
where nome_vendedor = "Geraldo";

select num_pedido, codigo_produto, quantidade 
from item_do_pedido where quantidade = 2;

select nome_cliente from cliente where cidade = "Sarandi";

select descricao_produto 
from produto
where val_unit >= 60.00;

select descricao_produto 
from produto
where val_unit >= 65.90 and codigo_produto = 3;

select descricao_produto 
from produto
where not val_unit <= 65.90;

select codigo_produto, descricao_produto 
from produto 
where val_unit between 64.00 and 66.00; 

select nome_vendedor, salario_fixo from vendedor order by nome_vendedor; 

select nome_cliente, cidade, UF from cliente order by UF desc, cidade desc; 

select descricao_produto, val_unit from produto where unidade = 5 order by 2 asc;

select min(salario_fixo), max(salario_fixo) from vendedor; 

select sum(quantidade) from item_do_pedido where codigo_produto = 2;

select avg(salario_fixo) from vendedor;

select * from vendedor;

select count(*) from vendedor where salario_fixo > 3.500;

select count(distinct salario_fixo) from vendedor;

select num_pedido  
from item_do_Pedido
where (select COUNT(*) from pedido where codigo_produto = codigo_produto) >  2;

select nome_cliente, pedido.codigo_cliente, num_pedido from cliente, pedido;

select nome_cliente, UF, prazo_entrega 
from cliente, pedido where uf in ("PB", "PE")  
and prazo_entrega > 2 and cliente.codigo_cliente = pedido.codigo_cliente;

select nome_cliente,  prazo_entrega 
from cliente, pedido 
where cliente.codigo_cliente = pedido.codigo_cliente 
order by prazo_entrega desc;
