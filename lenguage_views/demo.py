import math
hola""
print("hola")

class DemoSintaxis:
    """Clase para probar Treesitter"""
    def __init__(self, valor: int):
        self.valor = valor

    @property
    def cuadrado(self):
        return math.pow(self.valor, 2)

def funcion_ejemplo(items: list[str]) -> None:
    for i, item in enumerate(items):
        print(f"Item {i}: {item}")

if __name__ == "__main__":
    demo = DemoSintaxis(10)
    print(demo.cuadrado)
