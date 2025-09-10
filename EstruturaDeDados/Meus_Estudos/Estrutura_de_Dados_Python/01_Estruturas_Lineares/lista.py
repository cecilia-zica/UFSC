# A lista é uma estrutura de acesso genérico e por índice
lista = ['a', 'b', 'c', 'd']

# --- Operações de inserção e busca ---
# Inserir no início
lista.insert(0, 'x')
print("Após inserir no início:", lista) # Saída: Após inserir no início: ['x', 'a', 'b', 'c', 'd']

# Inserir no final
lista.append('y')
print("Após inserir no final:", lista) # Saída: Após inserir no final: ['x', 'a', 'b', 'c', 'd', 'y']

# Inserir em uma posição específica (ex: após o segundo elemento, índice 2)
lista.insert(2, 'z')
print("Após inserir na posição 2:", lista) # Saída: Após inserir na posição 2: ['x', 'a', 'z', 'b', 'c', 'd', 'y']

# Buscar um elemento
if 'z' in lista:
    print("Elemento 'z' encontrado na posição:", lista.index('z'))

# --- Operações de remoção ---
# Remover do início
elemento_removido = lista.pop(0)
print("Após remover do início:", lista)

# Remover do final
lista.pop()
print("Após remover do final:", lista)

# Remover de uma posição específica (ex: o elemento no índice 1)
elemento_removido_pos = lista.pop(1)
print(f"Após remover da posição 1 (elemento: {elemento_removido_pos}):", lista)