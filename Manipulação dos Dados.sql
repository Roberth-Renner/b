                                            
                                              --    SCRIPT COM A MANIPULAÇÃO E ANALISE DOS DADOS    --

-- SELEÇÃO SIMPLES COM SELECT PARA MOSTRAR CLIENTES CADASTRADOS COM CPF --

select concat(Fnome,' ', Lnome) as NomeCompleto, Endereco, CPF  from Cliente where CPF is not null;

-- SELEÇÃO PARA MANIPULAR OS TIPOS DE CATEGORIAS DO PEDIDO --

select concat(Fnome,' ', Lnome) as NomeCompleto, Descricao, Categoria
       from Produto
       inner join Realacao_Prod_Pedid Using (IdProduto)
       inner join Pedidos Using(IdPedido)
       inner join Cliente Using(Idcliente)
       where Categoria like 'Eletrônicos%' ;

-- CLIENTES QUE REALIZARAM O PAGAMENTO E ESTÃO NO ESTADO DE ENTREGA --

select concat(Fnome,' ', Lnome) as Nome_Completo, Estatus as Status_Pedido, TipoDeEntrega, Descricao, Quantidade, Frete, PreçoUnidade, round(((PreçoUnidade*Quantidade) + Frete), 2) as Total_a_Pagar
        from Pedidos p
        inner join Entrega e on p.IdPedido = e.IdPedido 
        inner join Cliente c on e.IdCliente = c.IdCliente
        order by PreçoUnidade desc;
        
-- CLIENTES QUE COMPRARAM COM VALORES ENTRE 500 E 5000 --
        
select concat(Fnome,' ', Lnome) as Nome_Completo, Estatus as Status_Pedido, TipoDeEntrega, Descricao, Quantidade, Frete, PreçoUnidade, round(((PreçoUnidade*Quantidade) + Frete), 2) as Total_a_Pagar
        from Pedidos p
        inner join Entrega e on p.IdPedido = e.IdPedido 
        inner join Cliente c on e.IdCliente = c.IdCliente
        where (PreçoUnidade between 500 and 5000);
        
-- QUANTIDADE DE PEDIDOS FEITO POR CADA CLIENTE --

select IdCliente, concat(Fnome,' ', Lnome) as Nome_Completo, count(*) as QuantidadePedidos
	from Pedidos p
       join Cliente c using(IdCliente)
       group by IdCliente;

-- VERIFICANDO SE ALGUM FORNECEDOR TAMBÉM É VENDEDOR --

select  v.CNPJ as CNPJ_Vendedor, v.RazaoSocial as RazaoSocial_Vendedor, f.CNPJ as CNPJ_Fornecedor, f.RazaoSocial as RazaoSocial_Fornecedor
	from Fornecedor as f
        join Vendedor as v on v.CNPJ = f.CNPJ;
        
-- RELAÇÃO DE PRODUTOS FORNECEDORES E ESTOQUE --

select p.Categoria, p.Pnome as Nome_Produto,RazaoSocial,CNPJ as CNPJ_FORNECEDOR, f.AvaliacaoFornecedor, Quantidade as Quantidade_em_Estoque, Elocal as Locacao_Estoque
       from fornecedor f
       join Relacao_Prod_Forn pf using(IdFornecedor)
       join Produto p using(IdProduto)
       join Relacao_Prod_Est pe using(IdProduto)
       join Estoque e using(IdEstoque) 
       order by AvaliacaoFornecedor desc;
       
-- RELACAO DE NOMES DOS PRODUTOS COM OS NOMES DAS FORNCEDORAS --       

select Pnome as Nome_Produto, Categoria, RazaoSocial as Nome_Fornecedor, CNPJ, Contato_F
       from Fornecedor
       join Relacao_Prod_Forn using(IdFornecedor)
       join Produto using(IdProduto);
        
        
        
        
        
        
        
