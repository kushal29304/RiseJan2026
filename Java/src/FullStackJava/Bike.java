package FullStackJava;

public class Bike extends Vehicle {
    private boolean hasSidecar;

    public Bike() {
        super();
        this.hasSidecar = false;
    }

    public Bike(String make, String model, int year, boolean hasSidecar) {
        super(make, model, year);
        this.hasSidecar = hasSidecar;
    }

    @Override
    public double calculateRoadTax() {
        return super.calculateRoadTax() + (hasSidecar ? 50.0 : 0.0);
    }
}
