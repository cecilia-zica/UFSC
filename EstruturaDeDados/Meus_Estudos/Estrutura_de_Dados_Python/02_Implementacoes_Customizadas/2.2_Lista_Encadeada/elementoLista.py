class ElementoLista:
    def __init__(self, valorNumerico):
        self.__valorNumerico = valorNumerico
        self.__proximo = None
    
    def getValor(self):
        return self.__valorNumerico
    
    def setValor(self, n):
        self.__valorNumerico = n
    
    def getProx(self):
        return self.__proximo
    
    def setProx(self, n):
        self.__proximo = n
    
    
    