#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    pid_t id1, id2;

    // Pai cria filho 1
    id1 = fork();
    if (id1 == 0) {
        printf("Processo %d filho de %d\n", getpid(), getppid());

        // Filho 1 cria seus 2 filhos
        pid_t n1 = fork();
        if (n1 == 0) {
            printf("Processo %d filho de %d\n", getpid(), getppid());
            exit(0);
        }

        pid_t n2 = fork();
        if (n2 == 0) {
            printf("Processo %d filho de %d\n", getpid(), getppid());
            exit(0);
        }

        exit(0); // filho 1 termina
    }

    // Pai cria filho 2
    id2 = fork();
    if (id2 == 0) {
        printf("Processo %d filho de %d\n", getpid(), getppid());

        // Filho 2 cria seus 2 filhos
        pid_t n3 = fork();
        if (n3 == 0) {
            printf("Processo %d filho de %d\n", getpid(), getppid());
            exit(0);
        }

        pid_t n4 = fork();
        if (n4 == 0) {
            printf("Processo %d filho de %d\n", getpid(), getppid());
            exit(0);
        }

        exit(0); // filho 2 termina
    }

    return 0;
}