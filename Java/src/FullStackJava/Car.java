package FullStackJava;

public class Car extends Vehicle {
    private int numDoors;

    public Car() {
        super();
        this.numDoors = 4;
    }

    public Car(String make, String model, int year, int numDoors) {
        super(make, model, year);
        this.numDoors = numDoors;
    }

    @Override
    public double calculateRoadTax() {
        return super.calculateRoadTax() + (numDoors * 15.0);
    }
}
