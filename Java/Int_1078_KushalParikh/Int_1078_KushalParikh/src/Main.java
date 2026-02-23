public class Main {
    public static void main(String[] args) {
        Person doctor = new Doctor("Dr. Kushal Parikh", 35, "Cardiology");
        Person patient = new Patient("Unnati Wadhvani", 30, 218500.00);

        System.out.println("Doctor Details");
        doctor.displayInfo();
        System.out.println(doctor.getRole());

        System.out.println();
        System.out.println("Patient Details");
        patient.displayInfo();
        System.out.println(patient.getRole());

        System.out.println();
        ((Billable) patient).generateBill();
    }
}
