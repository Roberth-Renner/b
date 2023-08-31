
												
												--    SCRIPT COM A INSERÇÃO DOS VALORES    --


-- INSERINDO OS VALORES DA TABELA CLIENTE --

insert into Cliente values(1, 'Roberth', 'R', 'Venancio', 'Copacabana-Rocinha, Rua-Monte Azul, 63 - RJ','PF', 14990823630,null, '2003-05-31'),
			  (2, 'Rafaela', 'D', 'Celeste', 'Belo Horizonte-Nova lima, Rua Cuba, 408 - MG','PF', 62718191272,null, '2000-09-29'),
			  (3, 'Fouch', 'L', 'Penaldo', 'Contagem-Maravilha, Rua Cruzada, 09 - PI','PF', 82917291878,null, '2001-02-25'),
			  (4, 'Palmer', 'P', 'Perini', 'Betim-londrina, Rua Santo Cristo, 98 - PR','PF', 98767853967,null, '1999-03-05'),
			  (5, 'Fraudi', 'N', 'Eitor', 'Ibirite-Cascata, Rua Kal marks, 76 - MG','PJ', null, 19827463749380, '1990-05-21'),
			  (6, 'Ivanete', 'B', 'Silva', 'Monte alto-Alfredo freitas, Rua-Monte Azul, 63 - RO','PJ', null,98271819882192, '1969-12-29');


-- INSERINDO OS VALORES DA TABELA PAGAMENTO --
-- UMA PESSOA PODE TER FEITO O PEDIDO E ESTAR NO STATUS DE 'ESPERANDO PAGAMENTO' --
-- NESSE CASO O PAGAMENTO VAI RETORNAR STATUS 'PAGAMENTO NAO REALIZADO' --

insert into Pagamento values(1, 1, 'Cartao'),
			    (2, 2, 'Boleto'),
                            (3, 1, 'Pix'),
                            (4, 3, 'Pix'),
                            (5, 2, 'Cartao'),
                            (6, 6, 'Boleto'),
                            (7, 5, default),
                            (8, 4, default);


-- INSERINDO OS VALORES DA TABELA PEDIDOS -- 
-- PARA ESTA TABELA ADICIONEI O CUPOM DE FRETE QUE RECEBE UM VALOR BOLEANO --
-- REALIZEI UM UPDATE PARA QUE QUANDO O CUPOM DE FRETE RECEBER TRUE O VALOR DE FRETE VAI RECEBER 0 --

update Pedidos
set Frete = case
    when CupomFrete = 1 then 0
    else Frete
end;

insert into Pedidos values  (1,1,'Hamburgao','Em andamento', 24.5, 1, 1, 2, 25.50),
			    (2,3,'Urso de pelucia','Pedido realizado', 10.99, 0, 4, 1, 25.50),
                            (3,1,'Geladeira','Pedido realizado', 250.99, 0, 3, 1, 2100.50),
                            (4,2,'Notebook','Finalizado', 80.99, 1, 2, 1, 3500.90),
                            (5,5,'Estante',default, 130.78, 0, 7, 1, 5000.99),
                            (6,6,'Mouse','Saiu para entrega', 25.70, 0, 6, 1, 359.80),
                            (7,2,'Secador','Em andamento', 5.70, 0, 5, 1, 300.30),
                            (8,4,'Liquidificador',default, 30.60, 1, 8, 2, 150.30);



-- INSERINDO OS VALORES DA TABELA ENTREGA --

insert into Entrega values  (1, 1, 1, 'Preparando pedido','Normal', 1387263741),
			    (2, 2, 4, 'Entrega realizada','Urgencia', 1827638273),
                            (3, 3, 2, 'Preparando pedido','Normal', 1472637465),
                            (4, 2, 7, 'Preparando pedido','Normal', 1326354782),
                            (5, 6, 6, 'Saiu para entrega','Normal', 1627383647),
                            (6, 1, 3, 'Preparando pedido','Urgencia', 1627362827);

-- INSERINDO OS VALORES DA TABELA PRODUTO --

insert into Produto values(1, 'Utensilios', 0, 'Secador', 5, '50-20-15'),
			  (2, 'Eletrodomésticos', 0, 'Geladeira', 4, '2050-90-90'),
                          (3, 'Utensilios', 1, 'Urso de pelucia', 3, '50-30-10'),
                          (4, 'Alimentos', default, 'Hamburgao', 5, '12-12-12'),
                          (5, 'Eletrônicos', 0, 'Notebook', 4, '35-25-5'),
                          (6, 'Eletrônicos', 0, 'Mouse', 3, '12-8-7'),
                          (7, 'Moveis', 0, 'Estante', 2, '2000-2000-50'),
                          (8, 'Eletrodomésticos', 0, 'Liquidificador', 3, '38-17');


-- INSERINDO OS VALORES DA TABELA ESTOQUE --

insert into Estoque values(1, 'Maravilha-Costa maranhense, Rua marfina, 34 - MA', 'Eletrodomésticos', 200),
			  (2, 'Diorgua-Marafim, Rua Praga, 97 - SC', 'Eletrônicos', 430),
                          (3, 'Santos-Costa santista, Rua Fernao dias, 18 - SP', 'Utensilios', 356),
                          (4, 'Guajajaras-Mario campos, Rua Vila cemig, 524 - MG', 'Moveis', 118),
                          (5, 'Betim-Jequitinhonha, Rua jundiai, 98 - MG', 'Alimentos', 4000);
                       


-- INSERINDO OS VALORES DA TABELA FORNECEDOR --

insert into Fornecedor values(1, 'Maravilha-Costa maranhense, Rua marfina, 34 - MA', 63718273827372, 'Eletroall', 41902837182, 5),
			     (2, 'Diorgua-Marafim, Rua Praga, 97 - SC', 18272837469809,'Teletric', 32983617289, 5),
		             (3, 'Santos-Costa santista, Rua Fernao dias, 18 - SP', 56743543789654,'Utili', 21987381928, 3),
			     (4, 'Guajajaras-Mario campos, Rua Vila cemig, 524 - MG', 43532169876546,'Move', 33978674532,  2),
			     (5, 'Betim-Jequitinhonha, Rua jundiai, 98 - MG', 56432123432467,'Hungmentos', 31998693152, 4);
	

-- INSERINDO OS VALORES DA TABELA VENDEDOR --

insert into Vendedor values(1, 'Monte-Fortuna , Rua Probefina, 67 - MG', 87656765678904,'Restaurante Sabores', 31357628983, 'Cantinho Sabor', 5),
			   (2, 'Loteamento-Porto , Rua Alcantara, 77 - LA', 45634567654321,'Servicos eletricos', 21345627813, 'Tudo eletrica', 5),
			   (3, 'Alfrida-Sul santista, Rua Forno, 12 - SP', 98786545634567,'Loja de Equipamentos Gerais', 41345672813, 'Geral Equipamentos', 3),
		           (4, 'Leroy-Mateus leme, Rua Cemigou, 84 - MG', 98765434367896,'Moveis ltda',31829182928, 'Estação Moveis', 4),
                           (5, 'Leroy-Mateus leme, Rua Cemigou, 98 - MG', 98765434365463,'skylimit ltda',31829182989, 'Tem trem de tudo', 4);


-- INSERINDO OS VALORES DA TABELA DE RELAÇÃO ENTRE VENDEDOR/PRODUTO -- *****

insert into Relacao_Prod_Vend values(1,1,3),
				    (2,2,1),
                                    (3,3,3),
                                    (4,4,5),
                                    (5,5,2),
                                    (6,6,2),
                                    (7,7,4),
                                    (8,8,3);


-- INSERINDO OS VALORES DA TABELA DE RELAÇÃO ENTRE FORNECEDOR/PRODUTO -- ****

insert into Relacao_Prod_Forn values(1,1,3),
				    (2,2,4),
                                    (3,3,3),
                                    (4,4,5),
                                    (5,5,2),
                                    (6,6,2),
                                    (7,7,4),
                                    (8,8,3);


-- INSERINDO OS VALORES DA TABELA DE RELAÇÃO ENTRE ESTOQUE/PRODUTO --

insert into Relacao_Prod_Est values(1,1,3),
				   (2,2,1),
				   (3,3,3),
				   (4,4,5),
				   (5,5,2),
				   (6,6,2),
				   (7,7,4),
				   (8,8,1);


-- INSERINDO OS VALORES DA TABELA DE RELAÇÃO ENTRE PEDIDOS/PRODUTO --

insert into Realacao_Prod_Pedid values(1,1,7),
			              (2,2,3),
                                      (3,3,2),
                                      (4,4,1),
                                      (5,5,4),
                                      (6,6,6),
                                      (7,7,5),
                                      (8,8,8);
                       
                            
                            
