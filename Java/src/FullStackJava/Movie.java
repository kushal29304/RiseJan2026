package FullStackJava;

class Movie {
    String name;

    Movie(String name) {
        this.name = name;
    }

    double getPrice() {
        switch (name) {
            case "Avengers": return 400;
            case "Pushpa 2": return 350;
            case "KGF 3": return 450;
            case "Avatar 3": return 500;
            default: return 0;
        }
    }
}