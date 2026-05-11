#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    pid_t id, id1, id2, id3;
    id = fork();
    if (id != 0)
        printf("Processo pai %d criou %d\n", getpid(), id);
    else{
        printf(“Processo filho %d\n”, getpid());
        exit(0); // filho sai e só o pai continua ! Obrigatório.
    }
    
    id1 = fork();
    if (id1 != 0)
        printf("Processo pai %d criou %d\n", getpid(), id1);
    else{
        printf(“Processo filho %d\n”, getpid());
        exit(0);
    }
    
    id2 = fork();
    if (id2 != 0)   
        printf("Processo pai %d criou %d\n", getpid(), id2);        
    else{
        printf(“Processo filho %d\n”, getpid());
        exit(0);
    }

    id3 = fork();
    if (id3 != 0)   
        printf("Processo pai %d criou %d\n", getpid(), id3);
    else{
        printf(“Processo filho %d\n”, getpid());
        exit(0);
    }
}