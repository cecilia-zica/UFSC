MAXLISTA = 100
ERROLISTACHEIA = -1
ERROLISTAVAZIA = -2
ERROPOSICAO    = -3

class ListaVetor:
    def __init__(self, capacidade=MAXLISTA):
        self.cap = capacidade
        self.dados = [None] * self.cap
        self.ultimo = -1  # -1 => vazia

    # --- Testes ---
    def lista_cheia(self):
        return self.ultimo == self.cap - 1

    def lista_vazia(self):
        return self.ultimo == -1

    # --- Inserções/remoções básicas ---
    def adiciona(self, dado):
        """Insere ao final. Retorna índice ou ERROLISTACHEIA."""
        if self.lista_cheia():
            return ERROLISTACHEIA
        self.ultimo += 1
        self.dados[self.ultimo] = dado
        return self.ultimo

    def retira(self):
        """Remove do final. Retorna valor removido ou ERROLISTAVAZIA."""
        if self.lista_vazia():
            return ERROLISTAVAZIA
        removido = self.dados[self.ultimo]
        self.dados[self.ultimo] = None
        self.ultimo -= 1
        return removido

    # --- Utilidades (opcionais) ---
    def contem(self, dado):
        """True/False"""
        for i in range(self.ultimo + 1):
            if self.dados[i] == dado:
                return True
        return False

    def posicao(self, dado):
        """Índice ou -1"""
        for i in range(self.ultimo + 1):
            if self.dados[i] == dado:
                return i
        return -1

    def adiciona_no_inicio(self, dado):
        if self.lista_cheia():
            return ERROLISTACHEIA
        # desloca para a direita
        self.ultimo += 1
        for i in range(self.ultimo, 0, -1):
            self.dados[i] = self.dados[i - 1]
        self.dados[0] = dado
        return 0

    def adiciona_na_posicao(self, dado, pos):
        if pos < 0 or pos > self.ultimo + 1:
            return ERROPOSICAO
        if self.lista_cheia():
            return ERROLISTACHEIA
        self.ultimo += 1
        for i in range(self.ultimo, pos, -1):
            self.dados[i] = self.dados[i - 1]
        self.dados[pos] = dado
        return pos

    def retira_da_posicao(self, pos):
        if self.lista_vazia():
            return ERROLISTAVAZIA
        if pos < 0 or pos > self.ultimo:
            return ERROPOSICAO
        removido = self.dados[pos]
        for i in range(pos, self.ultimo):
            self.dados[i] = self.dados[i + 1]
        self.dados[self.ultimo] = None
        self.ultimo -= 1
        return removido

    def destroi_lista(self):
        self.dados = [None] * self.cap
        self.ultimo = -1

    # debug/print
    def __repr__(self):
        return f"ListaVetor({[self.dados[i] for i in range(self.ultimo+1)]})"

# Exemplo rápido
if __name__ == "__main__":
    L = ListaVetor(5)
    print(L.adiciona(10))  # 0
    print(L.adiciona(20))  # 1
    print(L.retira())      # 20
    print(L.lista_cheia()) # False
    print(L.lista_vazia()) # False
    print(L)
