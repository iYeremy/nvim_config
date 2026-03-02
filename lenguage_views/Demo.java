import java.util.List;

public class Demo extends Object {
    @Override
    public String toString() {
        return "Prueba de Sintaxis";
    }

    public static void main(String[] args) {
        List<String> lista = List.of("Arch", "Hyprland", "Nvim");
        lista.forEach(System.out::println);
    }
}


