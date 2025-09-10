# A pilha é implementada com uma lista
pilha = []

# --- Operações de inserção ---
# push: adiciona um elemento no topo da pilha
pilha.append('elemento_A')
pilha.append('elemento_B')
pilha.append('elemento_C')

# Exibe a pilha após as inserções
print("Pilha atual:", pilha) # Saída: Pilha atual: ['elemento_A', 'elemento_B', 'elemento_C']

# --- Operações de remoção e consulta ---
# top: consulta o elemento no topo sem removê-lo
# Acessa o último elemento da lista
if pilha:
    topo = pilha[-1]
    print("Elemento no topo:", topo) # Saída: Elemento no topo: elemento_C
else:
    print("Pilha está vazia.")

# pop: remove o elemento do topo da pilha e o retorna
elemento_removido = pilha.pop()
print("Elemento removido:", elemento_removido) # Saída: Elemento removido: elemento_C
print("Pilha após o pop:", pilha) # Saída: Pilha após o pop: ['elemento_A', 'elemento_B']

# Verifica se a pilha está vazia
print("A pilha está vazia?", len(pilha) == 0)