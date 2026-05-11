#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>

int main() {
    pid_t id;
    id = fork();
    if (id == 0) {
        printf("Novo processo criado!\n Filho: %d\n", getpid());
    } else {
        printf("Novo processo criado!\n Pai: %d\n", getpid());
    }
}

// certo:
#include <unistd.h>
#include <stdio.h>

int main() {
    fork();
    printf("Novo processo criado! PID: %d\n", getpid());
    return 0;
}

