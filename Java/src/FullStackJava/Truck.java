package FullStackJava;

public class Truck extends Vehicle {
    private double payloadCapacity;

    public Truck() {
        super();
        this.payloadCapacity = 1.0;
    }

    public Truck(String make, String model, int year, double payloadCapacity) {
        super(make, model, year);
        this.payloadCapacity = payloadCapacity;
    }

    @Override
    public double calculateRoadTax() {
        return super.calculateRoadTax() + (payloadCapacity * 120.0);
    }
}
