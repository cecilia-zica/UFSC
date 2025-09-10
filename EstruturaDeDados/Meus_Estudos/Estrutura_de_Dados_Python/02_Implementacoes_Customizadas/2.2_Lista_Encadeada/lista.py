from elementoLista import ElementoLista

#● Inserir elemento
##– InserirComoPrimeiro ( novo )
#– InserirComoÚltimo ( novo )
#– InserirNaPosição ( posição , novo )
#– InserirAntesDe ( referência, novo )
#– InserirDepoisDe ( referência, novo )
#● Remoção de elemento
#– RemoverPrimeiro ()
#– RemoverÚltimo ()
#– RemoverDaPosição ( posição )
#– Remover ( referência ) # referência a identificador único
#– De posição relativa a outro elemento (antesDe, depoisDe) # menos usados
#● Consulta / Acesso
#– AcessaPrimeiro ()
#– AcessaÚltimo ()
#– AcessaDaPosição ( posição )

#---- Erros ----#
class ListaVaziaError(Exception): pass
class PosicaoInvalidaError(Exception): pass
class ListaCheiaError(Exception): pass

class Lista:
    def __init__(self):
        self.__inicio = None
        self.__fim = None
        self.__cont = 0
        self.__posicao = None

    # helper para o primeiro elemento
    def __contNulo(self, novoElemento):
        self.__inicio = novoElemento
        self.__fim = novoElemento
        self.__cont = 1

    def tamanho(self):
        return self.__cont

    def inserirComoPrimeiro(self, valor):
        """
            -testamos se há espaço
            -incrementamos o último
            -empurramos tudo para trás
            -adicionamos o novo dado na primeira posição
       """
        novoElemento = ElementoLista(valor) 
         if self__cont == 0:
            raise ListaVaziaError("lista vazia")
        else:
            novoElemento.setProx(self.__inicio)
            self.__inicio = novoElemento
            self.__cont ++= 1

    def inserirComoUltimo(self, valor):
        novoElemento = ElementoLista(valor)

        if self.__cont == 0:
            raise ListaVaziaError("lista vazia")
        else:
            self.__fim.setProx(novoElemento)
            self.__fim = novoElemento

        self.__cont += 1

    def InserirNaPosição(self, posicao, valor):
        """
        Procedimento
            -testamos se há espaço e se a posição existe
            -incrementamos o último
            -empurramos tudo para trás a partir da posição
            -adicionamos o novo dado na posição informada
        Parametros
            -dado a ser inserido
            -posição onde inserir
        """

        # ----- Posicao Inválida ----- #
        if posicao < 0 or posicao > self.__cont:
            raise PosicaoInvalidaError(f"posicao {posicao} fora de 0..{self.__cont}")

        if posicao == 0:
            self.inserirComoPrimeiro(valor);  return
        if posicao == self.__cont:
            self.inserirComoUltimo(valor);    return
            
        # ----- O caso principal ----- #
        novoElemento = ElementoLista(valor)

        # caminhar até o nó anterior (posicao-1)
        anterior = self.__inicio
        i = 0
        while i < posicao - 1:
            anterior = anterior.getProx()
            i += 1
        novo = ElementoLista(valor)
        novo.setProx(anterior.getProx()) # novo aponta para o que era o próximo do anterior
        anterior.setProx(novo) # anterior passa a apontar para o novo
        self.__cont += 1                
        
    def InserirAntesDe (referencia, valor):
        """
        Insere elemento antes de um valor referencia 
        """
        #--- Condições ---#
        if self.__cont == 0:
            raise ListaVaziaError("lista vazia")

        elif posicao < 0 or posicao > self.__cont + 1:
            raise PosicaoInvalidaError("posicao invalida")

        elif posicao == 0:
            self.inserirComoPrimeiro()
            return

        elif posicao == self.__cont:
            self.inserirComoUltimo()
            return
        
        # --- Inserção --- #
        
        novoElemento = ElementoLista()
        
        anterior = self.__inicio
        for _ in range(anterior, posicao - 1):
            anterior = anterior.getProx()

        novo = ElementoLista(valor)
        novo.setProx(anterior.getProx) # novo aponta para o que era o próximo do anterior
        anterior.setProx() # anterior passa a apontar para o novo
        self.__cont += 1

    def InserirDepoisDe (referencia, novo ):
    
    def RetiraDaPosicao(valor, posicao):
        """Procedimento:
            -Testamos se há elementos e se a posição existe
            -decrementamos o último
            -salvamos elemento na posição
            -empurramos tudo para frente até posição

         Parâmetros:
            -dado a ser inserido
            -posição onde inserir
            """
    if fonte > self.__cont or fonte < 0:
        return ERROPOSICAO
    
    else:
        ultimoEl = self__cont - 1
        novoElemento = ElementoLista(valor)
        anterior = elemento

        for _ in range(ultimoEl):
            anterior


        


