-- Verificando a qual cliente um animal pertence
SELECT C.nome, C.cpf, A.nome, A.raça
FROM CLIENTES AS C, ANIMAIS AS A
WHERE C.cpf = A.cpf_dono
	AND A.raça NOT IN (SELECT A.raça
						FROM ANIMAIS AS A
                        WHERE A.raça = 'vira lata');

-- Verificando o lider de setor pelo id
SELECT DISTINCT F.nome
FROM FUNCIONARIOS AS F
WHERE F.id IN (SELECT STL.id
				FROM SETOR_TEM_LIDER AS STL
                WHERE STL.id = '480224135690');

-- Listando os funcionarios que não são lideres de setores
SELECT F.nome
FROM FUNCIONARIOS AS F
WHERE F.id NOT IN (SELECT STL.id
					FROM SETOR_TEM_LIDER AS STL);
                    
-- Listando os funcionarios contratados e tercerizados
SELECT DISTINCT F.nome, NULL
FROM  FUNCIONARIOS AS F, FUNCION_CONTRATADOS AS FC
WHERE F.id = FC.id
UNION
SELECT DISTINCT F.nome, FT.empresa
FROM  FUNCIONARIOS AS F, FUNCION_TERCERIZADOS AS FT
WHERE F.id = FT.id;

-- Verificando qual cliente que comprou determinado item 
SELECT C.cpf_cliente
FROM COMPRAS AS C
WHERE C.código_produto IN (SELECT P.código
							FROM PRODUTOS AS P
							WHERE P.nome = 'Gaiola para Ramister');
	
-- Verificando os distribuidores de produtos de um determinado setor
SELECT F.nome_empresa
FROM FORNECEDORES AS F
WHERE F.produto IN (SELECT P.nome
					FROM PRODUTOS AS P
                    WHERE P.setor_produto IN (SELECT S.nome
												FROM SETORES AS S
                                                WHERE S.nome = 'Setor de Rações'));
                                                
-- Quais funcionarios fornecem determinado serviço
SELECT  DISTINCT F.nome
FROM FUNCIONARIOS AS F, FUNCION_TERCERIZADOS
WHERE F.id IN (SELECT FT.id
				FROM FUNCION_TERCERIZADOS AS FT
				WHERE FT.serviço = 'Consulta');

SELECT DISTINCT F.nome
FROM FUNCIONARIOS AS F, FUNCION_TERCERIZADOS
WHERE F.id IN (SELECT FT.id
				FROM FUNCION_TERCERIZADOS AS FT
                WHERE FT.serviço = 'Banho')
                UNION
                SELECT DISTINCT F.nome
				FROM FUNCIONARIOS AS F, FUNCION_TERCERIZADOS
				WHERE F.id IN (SELECT FT.id
				FROM FUNCION_TERCERIZADOS AS FT
                WHERE FT.serviço = 'Tosa');


-- Consultar quais funcionairos atendem no banho e tosa em um determinado horario
SELECT DISTINCT F.nome
FROM FUNCIONARIOS AS F
WHERE F.cpf IN (SELECT EBT.cpf
				FROM ESP_BANHO_TOSA AS EBT
                WHERE EBT.Hr_atendimento = '07:00-17:00');
                
-- Exibir funcionarios que não possuem especializaçoes e que não sejam contratados
SELECT F.nome	
FROM FUNCIONARIOS AS F
WHERE F.id NOT IN (SELECT Ep.id
					FROM ESPECIALIZAÇAO_POSSUIDA AS EP);
					
                   


	


