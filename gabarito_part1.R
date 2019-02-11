
### Exercicio 2

1. Altere o valor de v_numero para 42
`v_numero <- 42.5`
v_numero <- 41

2. Altere o valor de v_caractere para "universo"
`v_caractere <- "algum texto"`
v_caractere <- "universo"

3. Altere o valor de v_logical para FALSE
`v_logical <- TRUE`
v_logical <- FALSE


## Parte B: Estrutura de dados

### Exercicio 1

1. Crie um vetor chamado candidatos com os nomes dos cadidatos presidenciais de 2018 pela ordem de votos do primeiro turno:  `'Jair Bolsonaro'`, `'Fernando Haddad'`, `'Ciro Gomes'` e `'Geraldo Alckmin'` (nesta ordem).
candidatos <- c('Jair Bolsonaro', 'Fernando Haddad', 'Ciro Gomes', 'Geraldo Alckmin')

2. Em seguida crie outro vetor chamado votos com os números de votos dos quatro primeiros colocados para a eleição presidencial de 2018:  49.276.990, 31.342.005, 13.344.366 e 5.096.349.
votos <- c(49276990, 31342005, 13344366, 5096349)

3. A partir desses dois vetores crie um data frame que apresente os nomes dos candidatos e os números de votos desses candidatos no primeiro turno.
eleicoes_2018 <- data.frame(candidatos, votos)

4. Em seguida crie mais uma coluna para esse data frame com o partido político que o candidato se candidatou: Jair Bolsonaro - PSL, Fernando Haddad - PT, Ciro Gomes - PDT e Geraldo Alckmin - PSDB.
eleicoes_2018$partido <- c("PSL", "PT", "PDT", "PSDB")

5. Utilizando a indexação, obtenha apenas o número de votos e o partido dos candidatos Fernando Haddad e Ciro Gomes e atribua a um data frame diferente.
eleicoes_2018_red <- eleicoes_2018[2:3,2:3]

## Parte C: Controladores de fluxo

### Exercicio 1

1. Execute o código em data/eleicoes_sp.R para criar o data frame para o exercício. O data frame é o resultado da eleição do 1º turdo para governador do estado de São Paulo.
2. Utilizando o laço FOR e o condicional IF/ELSE, crie uma coluna no data frame com o nome porcentagem de votos em que indique a porcentagem de votos obtida por cada candidato.
4. Crie outra coluna com o nome resultado. O valor dessa coluna deve assumir o valor "Eleito" caso o candidato obteve mais de 50% dos votos. Caso nenhum candidato obteve essa porcentagem, os dois candidatos com maior porcentagem de votos devem ter a coluna com o valor "2º turno" e os demais como "Não Eleito".

#2.
eleicoes_sp$porc_voto <- NA # Criando uma coluna vazia

total_voto <- sum(eleicoes_sp$votos_sp)

for(i in 1:nrow(eleicoes_sp)){
  eleicoes_sp$porc_voto[i] <- (eleicoes_sp$votos_sp[i] / total_voto) * 100
}

#3;
eleicoes_sp$resultado <- NA # Criando uma coluna vazia

for(i in 1:nrow(eleicoes_sp)){
  if(eleicoes_sp$porc_voto[i] > 50) {
    eleicoes_sp$resultado[i] <- "Eleito"
  }
}

#Em caso de nenhum eleito
top_votos <- tail(sort(eleicoes_sp$porc_voto),2)

for(i in 1:nrow(eleicoes_sp)){
  if(eleicoes_sp$porc_voto[i]  %in% top_votos) {
    eleicoes_sp$resultado[i] <- "2º turno"
  } else {
    eleicoes_sp$resultado[i] <- "Não Eleito"
  }
}