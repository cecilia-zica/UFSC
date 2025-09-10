class ElementoPilha:
    def __init__(self, valorNumerico):
        self.__valorNumerico = valorNumerico
        self.__anterior = None
    
    def getValor(self):
        return self.__valorNumerico
    
    def setValor(self, n):
        self.__valorNumerico = n
    
    def getAnterior(self):
        return self.__anterior
    
    def setAnterior(self, n):
        self.__anterior = n
    
    
    