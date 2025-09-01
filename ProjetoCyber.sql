CREATE SCHEMA marcenaria

CREATE TABLE marcenaria.materia (
	id_materia INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nome_materia TEXT NOT NULL,
	fornecedor TEXT NOT NULL,
	unidade_medida TEXT NOT NULL,
	estoque TEXT NOT NULL,
	custo NUMERIC (18,2)
	);

CREATE TABLE marcenaria.produtoFinal (
	id_produto INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	nome_produto TEXT NOT NULL,
	preco_final NUMERIC (18,2)
	);

CREATE TABLE marcenaria.listaMateria (
	id_lista INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_produto INT NOT NULL REFERENCES marcenaria.produtoFinal(id_produto),
	id_materia INT NOT NULL REFERENCES marcenaria.materia(id_materia),
	quantidade INT NOT NULL
	);

CREATE TABLE marcenaria.pedido (
	id_pedido INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	id_produto INT NOT NULL REFERENCES marcenaria.produtoFinal(id_produto),
	data_entrega TIMESTAMPTZ NOT NULL,
	cliente TEXT NOT NULL,
	status_pedido TEXT NOT NULL
	);

INSERT marcenaria.materia
INTO 
	('Chapa de MDF Carvalho 18mm','Madeiras & Cia','m2',25,150),
	('Parafuso Phillips 4mm','Parafuso Central','Unidade',850,0.25),
	('Dobradiça de Pistão','Ferragens ABC','Unidade',110,15),
	('Puxador de Alumínio Escovado','Ferragens ABC','Unidade',60,25),
	('Verniz Marítimo','Tintas de Qualidade','Litro',8,55);
