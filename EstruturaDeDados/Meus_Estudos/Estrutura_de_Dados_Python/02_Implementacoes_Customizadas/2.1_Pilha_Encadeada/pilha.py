from elemento import Elemento
    
class Pilha:
    def __init__(self):
        self.__topo = None

    def pop(self):
        if self.__topo != None:
            novoTopo = topo.getAnterior()
            self.__topo = novoTopo
        else:
            raise Exception
    
    def push(self, n):
        novoElemento = Elemento(n)
        novoElemento.setAnterior(self.__topo) 
        self.__topo = novoElemento



        
