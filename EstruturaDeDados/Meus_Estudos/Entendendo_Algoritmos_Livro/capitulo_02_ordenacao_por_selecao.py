#Encontrando o menor elemeno de um array
def busca_menor(arr):
    menor = arr[0] #armazena menor valor
    menor_indice = 0 #armazena o indice do menor valor
    for i in range(1, len(arr)):
        if arr[i] < menor:
            menor = arr[i]
            menor_indice = i
            menor = arr[menor_indice]
    return menor

def ordenacao_por_selecao(arr):
    novo_arr = []
    for i in range(len(arr)):
        menor = busca_menor(arr)
        novo_arr.append(arr.pop(menor))
    return novo_arr
# Exemplo de uso
minha_lista = [64, 25, 12, 22, 11]
print("Lista ordenada:", busca_menor(minha_lista))

