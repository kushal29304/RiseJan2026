package FullStackJava;

public class Vehicle {
    protected String make;
    protected String model;
    protected int year;

    public Vehicle() {
        this("Unknown", "Unknown", 2026);
    }

    public Vehicle(String make, String model, int year) {
        this.make = make;
        this.model = model;
        this.year = year;
    }

    public double calculateRoadTax() {
        int currentYear = 2026;
        int age = currentYear - year;
        return age > 10 ? 100.0 : 200.0;
    }

    @Override
    public String toString() {
        return make + " " + model + " (" + year + ")";
    }
}
