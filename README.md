# Hadoop-Blog

### Como executar (supondo que ja tenha as dependências instaladas)


##### Popular o banco de dados

```bash
rake db:seed
```

##### Executar Hadoop Individualmente

```bash
hadoop jar build/word_count.jar word-count -conf conf/hadoop-local.xml README.md output
```
