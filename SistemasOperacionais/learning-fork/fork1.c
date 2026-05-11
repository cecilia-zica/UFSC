#include <stdio.h>
#include <unistd.h> // Aqui está o fork()!
#include <sys/types.h>

//getpid() -> pid do próprio processo
//getppid() -> pid do processo pai
//fork -> SO NO PAI -> da o pid do filho
//waitpid -> O pai só vai executar o que vem depois do waitpid, depois que o filho der return 0

int main() {
    printf("Mensagem ANTES do fork (PID: %d)\n", getpid());

    // O DESAFIO: 
    // Chame a função fork() aqui e armazene o retorno em uma variável 'pid'
    pid_t x;
    x = fork();
    if(x == 0){
        printf("Eu sou o filho, meu pid é %d, e do meu pai é %d.\n", getpid(), getppid());
    }
    else if(x > 0){
        printf("Eu sou o pai, meu pid é %d, e do meu filho é %d.\n", getpid(), x);
    }
    
    // Escreva um printf DEPOIS do fork dizendo "Oi" e mostrando o PID atual
    
    return 0;
}