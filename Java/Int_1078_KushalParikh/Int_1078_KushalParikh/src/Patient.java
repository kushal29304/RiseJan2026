public class Patient extends Person implements Billable {
    private final double treatmentCost;

    public Patient(String name, int age, double treatmentCost) {
        super(name, age);
        this.treatmentCost = treatmentCost;
    }
    @Override
    public String getRole() {
        return "Role: Patient";
    }
    @Override
    public void generateBill() {
        System.out.printf("Total Bill: %.2f%n Rupees", treatmentCost);
    }
}
