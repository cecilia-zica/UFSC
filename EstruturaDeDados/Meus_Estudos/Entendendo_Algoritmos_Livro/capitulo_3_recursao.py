def procure_pela_chave(caixa_principal):
    # use uma lista como pilha
    pilha = [caixa_principal]

    while pilha:  # enquanto a pilha não estiver vazia
        caixa = pilha.pop()  # tira o topo da pilha

        # se 'caixa' é iterável, podemos fazer direto:
        for item in caixa:
            if item.e_uma_caixa():
                pilha.append(item)         # empilha a subcaixa
            elif item.e_uma_chave():
                print("Achei a chave!")
                return item                 # ou True, se preferir

    # se terminar o while sem achar
    return None

def procure_pela_chave(caixa):
    for item in caixa:
        if item.e_uma_caixa():
            procure_pela_chave(item)   # chamada recursiva
        elif item.e_uma_chave():
            print("Achei a chave!")
            return True   # se quiser parar quando achar
    return False

#Caso-base
def regressiva_recursiva(i):
    print (i)
    regressiva_recursiva(i-1)

def regressiva_base(i):
    print(i)
    if i <= 0:     # condição de parada
        return
    else:
        regressiva_base(i-1)

# Exemplo de uso

# regressiva_base(5) -> 5, 4, 3, 2, 1, 0
# regressiva_recursiva(3) 3, 2, 1, 0, -1, -2, -3 ...-infinito