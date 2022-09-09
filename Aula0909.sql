CREATE TABLE Filmes
(
titulo VARCHAR(250),
ano NUMBER(4),
diretor VARCHAR(100),
genero VARCHAR(20),
atoresPrincipais VARCHAR(1000),
duracao NUMBER(4), -- em minutos
valorIngresso NUMBER(5,2)
);

a. Selecione os atores que atuaram em filmes do gênero ‘terror’, sem repetição e por ordem alfabética inversa;
b. Selecione os títulos de filmes que foram lançados no século XX cuja duração for inferior a 1h10;
c. Selecione o título do filme, nome do diretor e valor do ingresso por minuto rodado do filme (tal campo deve ter o nome ‘PrecoMinuto’).
d. Atualize os registros da tabela inflacionando o valor do ingresso em 2,7% apenas para os filmes estrelados por Nicholas Cage;
e. Exclua os filmes cujo valor do ingresso por minuto seja inferior a R$ 0,13.
f. Insira o filme de drama/romance “Titanic 3D”, de 1997, dirigido por James Cameron, estrelado por Leonardo DiCaprio e Kate Winslet, com duração de 3h14 e ingresso no valor de $18.
