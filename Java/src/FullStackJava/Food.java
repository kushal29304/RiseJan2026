package FullStackJava;

class Food {
    int popcorn;
    int coke;
    int nachos;

    Food(int popcorn, int coke, int nachos) {
        this.popcorn = popcorn;
        this.coke = coke;
        this.nachos = nachos;
    }

    double calculateFoodCost() {
        return (popcorn * 150) + (coke * 100) + (nachos * 200);
    }
}
