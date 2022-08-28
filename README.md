# apple_academy_test

# Informações de instalação e compilação do programa

 1. instale o Dart através do tutorial no site oficial: [clicando aqui](https://dart.dev/get-dart)
 2. clone o projeto através do `git clone (url)`
 3. abra o repositório do projeto no console/prompt ex: `cd localdoclone/apple_academy_test`
 4. execute o comando `dart run main.dart`

 ## Outra Alternativa

 1. rode o programa através do dartpad, [clicando aqui](https://dartpad.dev/?id=376a5b43022c820bfe5ddb377b2659e1)
 2. sem necessidade de instalar nada


## Informações adicionais sobre o projeto e seu funcionamento

 1. o programa recebe uma lista de alunos, lista dos ciclos anteriores e um limite para as equipes(quantas pessoas por grupo)
 2. o programa mostra os estudantes que não conseguiram formar grupo devido a repetição com outros alunos em ciclos anteriores
 3. devido o foco em resolver o problema, o programa não adiciona o novo ciclo no objeto passado, apenas mostra o mesmo na tela/console


### Informações sobre como funciona o programa
 O programa recebe três parâmetros: **limite de pessoas por grupo, os alunos e os ciclos anteriores**. Após receber os parâmetros, o programa percorre a lista de alunos seguindo como inspiração o método [quick sort](https://pt.wikipedia.org/wiki/Quicksort), onde basicamente consiste em um método de ordenação onde tem-se um pivô que inicia no primeiro valor do array e um segundo pivô que recebe como valor o valor do primeiro vetor + 1. O programa então, percorre todo o array através do segundo pivô e faz comparações dentro da lista de ciclos.

 Se os dois valores(pivô 1 e pivô 2) ou os que estiverem sendo comparados para time até o momento não estiverem no mesmo time em nenhum dos ciclos passados, eles são salvos dentro de um array temporário chamado *sameGroup* até conseguir atingir o limite de estudantes para o grupo. Ao atingir o limite da equipe, o array *sameGroup* é salvo dentro de outro array final chamado de *resultTeam* e os pivôs são reiniciados, podendo partir para os próximos valores no array a serem comparados. O programa ainda, retira todos os nomes que já foram comparados e que podem fazer equipe de dentro do array principal, com a finalidade de deixar apenas os alunos que não podem fazer equipe no array.

 Esse método é repetido até percorrer todo o vetor, que por sua vez é repetido *N vezes* onde *n = limite de participantes em um grupo*.

 Ao final da execução então, temos a lista *group* que possui todos os grupos possíveis e a lista *students* que durante a execução foi modificada, possuindo apenas os nomes de alunos que não conseguiram formar equipe.
 