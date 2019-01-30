votacao <- read_csv('data/votacao_candidato.gz')

head(votacao)

votacao %>% 
  group_by(SIGLA_PARTIDO, DESCRICAO_CARGO) %>% 
  summarise(TOTAL = sum(TOTAL_VOTOS)) %>% 
  spread(DESCRICAO_CARGO, TOTAL) %>% 
  write_csv('data/total_votos_partidos.csv')
