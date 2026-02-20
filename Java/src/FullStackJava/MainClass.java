package FullStackJava;

public class MainClass {
    public static void main(String[] args) {
        Vehicle carDefault = new Car();
        Vehicle carParam = new Car("Honda", "City", 2021, 4);
        Vehicle truckParam = new Truck("Volvo", "FH16", 2012, 10.0);
        Vehicle bikeDefault = new Bike();
        Vehicle bikeParam = new Bike("Royal Enfield", "Classic 350", 2018, true);

        Vehicle[] vehicles = {carDefault, carParam, truckParam, bikeDefault, bikeParam};

        System.out.println("Road Tax Details:");
        for (Vehicle vehicle : vehicles) {
            System.out.printf("%-35s -> Tax: %.2f%n", vehicle.toString(), vehicle.calculateRoadTax());
        }
    }
}
