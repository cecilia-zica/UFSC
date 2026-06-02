class No:
    def __init__(self, dado):
        self.dado = dado
        self.prox = None #referencia para o próximo nó
        self.ant = None
class ListaSimplesmenteEncadeada():
    def __init__(self):
        self.prim = None   # primeiro elemento da lista
        self.ult = None    # último elemento da lista

    def inserir_no_fim(self, dado):
        novo = No(dado)

        #se a lista estiver vazia
        if self.prim is None:
            self.prim = novo
            self.ult = novo

        else:
            self.ult.prox = novo 
            self.ult = novo

    def remover_inicio(self):
        if self.prim is None:
            print("Lista Vazia!")
            return None
        
        removido = self.prim
        self.prim = self.prim.prox

        if self.prim is None:
            self.ult = None
        
        return removido.dado

        
    def mostrar_lista(self):
        atual = self.prim
        if atual is None:
            print("Lista vazia!")
            return
        while atual is not None:
            print(atual.dado, end="->")
            atual = atual.prox
        print("None")
    
    def remover_dado(self, dado):
        #suportar remocao de dado especifico
        if self.prim is None:
            print("lista vazia!")
            return False
        
        atual = self.prim 

        while atual is not None and atual.dado != dado:
            anterior = atual
            atual = atual.prox
        
        if atual is None:
            print(f"Valor {dado} não encontrado.")
            return False

        # caso 1: é o primeiro elemento
        if anterior is None:
            self.prim = atual.prox
        else:
            anterior.prox = atual.prox

        # caso 2: é o último elemento
        if atual == self.ult:
            self.ult = anterior

        return True

    def buscar(self, valor):
        """Retorna o nó cujo dado == valor, ou None se não encontrar."""
        atual = self.prim
        while atual is not None:
            if atual.dado == valor:
                return atual
            atual = atual.prox
        return None
            




