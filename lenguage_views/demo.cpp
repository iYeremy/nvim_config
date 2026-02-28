#include <iostream>
#include <vector>

#define MAX_SIZE 100

template <typename T>
class Contenedor {
private:
    T dato;
public:
    Contenedor(T d) : dato(d) {}
    void mostrar() {
        std::cout << "Dato: " << dato << std::endl;
    }
};

int main() {
    auto lista = std::vector<int>{1, 2, 3};
    Contenedor<std::string> c("Hola Treesitter");
    c.mostrar();
    return 0;
}
