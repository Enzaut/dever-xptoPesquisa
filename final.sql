-- Tabela de Estados
create database exercicio;
use exercicio;
CREATE TABLE Estados (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de Cidades
CREATE TABLE Cidades (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    estado_id INT,
    FOREIGN KEY (estado_id) REFERENCES Estados(id)
);

-- Tabela de Departamentos
CREATE TABLE Departamentos (
    id_departamento BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(255) NOT NULL,
    filial VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT='Departamentos da empresa';

-- Tabela de Fontes Financiadoras
CREATE TABLE Fontes_Financiadoras (
    id_fonte BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_fonte VARCHAR(255) NOT NULL,
    investimento DECIMAL(10, 2) NOT NULL CHECK (investimento >= 0)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT='Fontes de financiamento';
drop table pesquisadores;
-- Tabela de Pesquisadores
CREATE TABLE Pesquisadores (
    id_pesquisador BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    status VARCHAR(50) DEFAULT 'Ativo',
    bolsa DECIMAL(10, 2) NOT NULL CHECK (bolsa >= 0),
    cidade_id INT NOT NULL,
    departamento_id BIGINT NOT NULL,
    projeto_id BIGINT NOT NULL,  -- Chave estrangeira para a tabela Projetos
    FOREIGN KEY (cidade_id) REFERENCES Cidades(id),
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (projeto_id) REFERENCES Projetos(id_projeto) -- Garantindo a relação 1 para N
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Pesquisadores';

-- Tabela de Projetos
CREATE TABLE Projetos (
    id_projeto BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_projeto VARCHAR(255) NOT NULL,
    valor_produto DECIMAL(10, 2) NOT NULL CHECK (valor_produto >= 0),
    departamento_id BIGINT NOT NULL,
    fonte_financiadora_id BIGINT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (fonte_financiadora_id) REFERENCES Fontes_Financiadoras(id_fonte)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COMMENT='Projetos de pesquisa';

-- Inserir dados na tabela de Estados
INSERT INTO Estados (id, nome) VALUES
(1, 'Acre'),
(2, 'Alagoas'),
(3, 'Amapá'),
(4, 'Amazonas'),
(5, 'Bahia'),
(6, 'Ceará'),
(7, 'Distrito Federal'),
(8, 'Espírito Santo'),
(9, 'Goiás'),
(10, 'Maranhão'),
(11, 'Mato Grosso'),
(12, 'Mato Grosso do Sul'),
(13, 'Minas Gerais'),
(14, 'Pará'),
(15, 'Paraíba'),
(16, 'Paraná'),
(17, 'Pernambuco'),
(18, 'Piauí'),
(19, 'Rio de Janeiro'),
(20, 'Rio Grande do Norte'),
(21, 'Rio Grande do Sul'),
(22, 'Rondônia'),
(23, 'Roraima'),
(24, 'Santa Catarina'),
(25, 'São Paulo'),
(26, 'Sergipe'),
(27, 'Tocantins');

-- Inserir dados na tabela de Cidades
INSERT INTO Cidades (id, nome, estado_id) VALUES
(1, 'Rio Branco', 1),
(2, 'Maceió', 2),
(3, 'Macapá', 3),
(4, 'Manaus', 4),
(5, 'Salvador', 5),
(6, 'Fortaleza', 6),
(7, 'Brasília', 7),
(8, 'Vitória', 8),
(9, 'Goiânia', 9),
(10, 'São Luís', 10),
(11, 'Cuiabá', 11),
(12, 'Campo Grande', 12),
(13, 'Belo Horizonte', 13),
(14, 'Belém', 14),
(15, 'João Pessoa', 15),
(16, 'Curitiba', 16),
(17, 'Recife', 17),
(18, 'Teresina', 18),
(19, 'Rio de Janeiro', 19),
(20, 'Natal', 20),
(21, 'Porto Alegre', 21),
(22, 'Porto Velho', 22),
(23, 'Boa Vista', 23),
(24, 'Florianópolis', 24),
(25, 'São Paulo', 25),
(26, 'Aracaju', 26),
(27, 'Palmas', 27),
(28, 'Cabo Frio', 19),       -- Rio de Janeiro
(29, 'Campinas', 25),        -- São Paulo
(30, 'Guarulhos', 25),       -- São Paulo
(31, 'Belo Horizonte', 13);  -- Minas Gerais
drop table cidades;
-- Inserir dados na tabela de Departamentos
INSERT INTO Departamentos (nome_departamento, filial) VALUES
('DIDES', 'NORTE'),
('DIRUR', 'SUL'),
('DIMAC', 'NORTE'),
('DIMAC', 'SUL'),
('DIDES', 'SUL'),
('DINTE', 'SUDESTE'),
('DISOC', 'SUDESTE'),
('DISOC', 'SUDESTE'),
('DISOC', 'SUDESTE');

-- Inserir dados na tabela de Fontes Financiadoras
INSERT INTO Fontes_Financiadoras (nome_fonte, investimento) VALUES
('BID - Banco Interamericano de Desenvolvimento', 100000.00),
('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 30000.00),
('BID - Banco Interamericano de Desenvolvimento', 100000.00),
('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 200000.00),
('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 50000.00),
('BANERJ - Banco do Estado do Rio de Janeiro', 70000.00),
('BANESPA - Banco do Estado de São Paulo', 45000.00),
('BANESPA - Banco do Estado de São Paulo', 85000.00),
('BDMG - Banco de Desenvolvimento de Minas Gerais', 120000.00);
select * from estados;
-- Inserir dados na tabela de Pesquisadores
INSERT INTO Pesquisadores (nome, status, bolsa, cidade_id, departamento_id, projeto_id) VALUES
('Miguel Silva', 'Ativo', 3100.00, 23, 1, 1),  -- DIDES em Boa Vista, Roraima
('Arthur Carvalho', 'Ativo', 2500.00, 27, 3, 3),  -- DIMAC em Palmas, Tocantins
('Helena Sousa', 'Inativo', 4000.00, 21, 2, 2),  -- DIRUR em Porto Alegre, Rio Grande do Sul
('Laura Pereira', 'Ativo', 2500.00, 3, 4, 4),  -- DIMAC em Macapá, Amapá
('Gabriel Luz', 'Ativo', 3200.00, 14, 5, 5),  -- DIDES em Belém, Pará
('Samuel Santos', 'Inativo', 2000.00, 27, 1, 1),  -- DIDES em Palmas, Tocantins
('Maria Oliveira', 'Ativo', 2500.00, 23, 1, 1),  -- DIDES em Boa Vista, Roraima
('Alice Rodrigues', 'Ativo', 3100.00, 24, 2, 2),  -- DIRUR em Florianópolis, Santa Catarina
('Bernardo Alves', 'Ativo', 2000.00, 22, 4, 4),  -- DIMAC em Porto Velho, Rondônia
('Theo Gomes', 'Inativo', 2500.00, 1, 5, 5),  -- DIDES em Rio Branco, Acre
('Ailton Santos', 'Ativo', 3100.00, 19, 6, 6),  -- DINTE em Cabo Frio, Rio de Janeiro
('Ana Beatriz', 'Ativo', 1500.00, 6, 8, 8),  -- DIMAC em Fortaleza, Ceará
('Bruno Gomes', 'Inativo', 3500.00, 12, 8, 8),  -- DIRUR em Campo Grande, Mato Grosso do Sul
('Leticia Rodrigues', 'Ativo', 2500.00, 15, 8, 9),  -- DIMAC em João Pessoa, Paraíba
('Vinicius Silva', 'Ativo', 2800.00, 25, 6, 6);  -- DIRUR em São Paulo, São Paulo

select * from estados;
-- Inserir dados na tabela de Projetos
INSERT INTO Projetos (nome_projeto, valor_produto, departamento_id, fonte_financiadora_id) VALUES
('Acesso a Oportunidades', 15000.00, 1, 1),  -- DIDES, BID
('Brasil em Desenvolvimento', 19000.00, 2, 2),  -- DIRUR, BNDES
('Emprego no Turismo', 35000.00, 3, 1),  -- DIMAC, BID
('Mapa das Organizações da Sociedade Civil', 55000.00, 3, 2),  -- DIMAC, BNDES
('Observatório de Gestão do Conhecimento', 20000.00, 1, 2),  -- DIDES, BNDES
('Atlas da Violência', 45000.00, 6, 6),  -- DINTE, BANERJ
('Centro de Pesquisa em Ciência, Tecnologia e Sociedade', 25000.00, 7, 7),  -- DISOC, BANESPA
('Retrato das Desigualdades de Gênero e Raça', 32000.00, 7, 7),  -- DISOC, BANESPA
('Índice de Vulnerabilidade Social', 60000.00, 7, 8);  -- DISOC, BDMG

-- Liste os projetos e suas fontes financiadoras, incluindo o nome do projeto e o nome da fonte financiadora; 
SELECT p.nome_projeto AS nome_projeto, ff.nome_fonte AS fonte_financiadora
FROM Projetos p
JOIN Fontes_Financiadoras ff ON p.fonte_financiadora_id = ff.id_fonte;

-- Liste os projetos gerenciados pelos departamentos, incluindo o nome do projeto e o nome do departamento; 
SELECT p.nome_projeto AS nome_projeto, d.nome_departamento AS nome_departamento
FROM Projetos p
JOIN Departamentos d ON p.departamento_id = d.id_departamento;

--  Liste os pesquisadores presentes na filial "NORTE", incluindo o nome do pesquisador e a filial do departamento;
SELECT pes.nome AS nome_pesquisador, d.filial AS filial_departamento
FROM Pesquisadores pes
JOIN Departamentos d ON pes.departamento_id = d.id_departamento
WHERE d.filial = 'NORTE';

-- Liste os pesquisadores presentes na filial "SUL", incluindo o nome do pesquisador e a filial do departamento;
SELECT pes.nome AS nome_pesquisador,d.filial AS filial_departamento
FROM Pesquisadores pes
JOIN Departamentos d ON pes.departamento_id = d.id_departamento
WHERE d.filial = 'SUL';

-- Liste o nome e a cidade dos pesquisadores presentes no projeto "Acesso a Oportunidades", incluindo o nome do pesquisador, a cidade e o nome do projeto; 
SELECT pes.nome AS nome_pesquisador, c.nome AS cidade, p.nome_projeto AS nome_projeto
FROM Pesquisadores pes
JOIN Projetos p ON pes.projeto_id = p.id_projeto
JOIN Cidades c ON pes.cidade_id = c.id
WHERE p.nome_projeto = 'Acesso a Oportunidades';

-- Liste o nome do pesquisador, valor da bolsa, nome do projeto e departamento dos pesquisadores que moram em “Roraima”;
SELECT pes.nome AS nome_pesquisador, pes.bolsa AS valor_bolsa, p.nome_projeto AS nome_projeto, d.nome_departamento AS nome_departamento
FROM Pesquisadores pes
JOIN Projetos p ON pes.projeto_id = p.id_projeto
JOIN Departamentos d ON pes.departamento_id = d.id_departamento
JOIN Cidades c ON pes.cidade_id = c.id
JOIN Estados e ON c.estado_id = e.id
WHERE e.nome = 'Roraima';

-- Liste todos os pesquisadores (pesquisador, valor da bolsa, nome do projeto, nome do departamento) e sua localização (cidade e estado); 
SELECT pes.nome AS nome_pesquisador, pes.bolsa AS valor_bolsa, p.nome_projeto AS nome_projeto, d.nome_departamento AS nome_departamento, c.nome AS cidade, e.nome AS estado
FROM Pesquisadores pes
JOIN Projetos p ON pes.projeto_id = p.id_projeto
JOIN Departamentos d ON pes.departamento_id = d.id_departamento
JOIN Cidades c ON pes.cidade_id = c.id
JOIN Estados e ON c.estado_id = e.id;

-- Liste o estado que mais possui pesquisadores, apresentando a quantidade de pesquisadores;
SELECT e.nome AS estado, COUNT(pes.id_pesquisador) AS quantidade_pesquisadores
FROM Pesquisadores pes
JOIN Cidades c ON pes.cidade_id = c.id
JOIN Estados e ON c.estado_id = e.id
GROUP BY e.nome
ORDER BY quantidade_pesquisadores DESC
LIMIT 1;

-- Liste todos os projetos (nome do projeto, departamento, filial departamento, fonte financiadora, valor a investir da fonte financiadora e valor do projeto), considerando a ordem de maior valor a ser investido. 
SELECT p.nome_projeto AS nome_projeto, d.nome_departamento AS nome_departamento, d.filial AS filial_departamento, ff.nome_fonte AS fonte_financiadora, ff.investimento AS valor_a_investir,p.valor_produto AS valor_do_projeto
FROM Projetos p
JOIN Departamentos d ON p.departamento_id = d.id_departamento
JOIN Fontes_Financiadoras ff ON p.fonte_financiadora_id = ff.id_fonte
ORDER BY ff.investimento DESC;

