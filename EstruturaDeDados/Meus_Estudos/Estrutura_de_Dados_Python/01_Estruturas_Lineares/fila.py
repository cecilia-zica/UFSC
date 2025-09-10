# Importa a fila otimizada do módulo collections
from collections import deque

# A fila é implementada com um deque
fila = deque()

# --- Operações de inserção ---
# enqueue: adiciona um elemento no final da fila
fila.append('cliente_1')
fila.append('cliente_2')
fila.append('cliente_3')

# Exibe a fila após as inserções
print("Fila atual:", fila) # Saída: Fila atual: deque(['cliente_1', 'cliente_2', 'cliente_3'])

# --- Operações de remoção e consulta ---
# front: consulta o elemento na frente sem removê-lo
if fila:
    frente = fila[0]
    print("Elemento na frente:", frente) # Saída: Elemento na frente: cliente_1
else:
    print("Fila está vazia.")

# dequeue: remove o elemento da frente da fila e o retorna
elemento_removido = fila.popleft()
print("Elemento removido:", elemento_removido) # Saída: Elemento removido: cliente_1
print("Fila após o dequeue:", fila) # Saída: Fila após o dequeue: deque(['cliente_2', 'cliente_3'])

# Verifica se a fila está vazia
print("A fila está vazia?", len(fila) == 0)