package FullStackJava;
import java.sql.*;

public class SqlAssignment {
    static final String URL = "jdbc:mysql://localhost:3306/employeedb";
    static final String USER = "root";
    static final String PASS = "root";

    //INSERT
    public static void insertEmployee(String name, int age, double salary) {
        String query = "INSERT INTO Employee (name, age, salary) VALUES (?, ?, ?)";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setDouble(3, salary);

            ps.executeUpdate();
            System.out.println("Employee Inserted ✅");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //VIEW ALL
    public static void viewEmployees() {
        String query = "SELECT * FROM Employee";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            System.out.println("ID | Name | Age | Salary");

            while (rs.next()) {
                System.out.println(
                        rs.getInt("id") + " | " +
                                rs.getString("name") + " | " +
                                rs.getInt("age") + " | " +
                                rs.getDouble("salary")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //UPDATE
    public static void updateEmployee(int id, String name, int age, double salary) {
        String query = "UPDATE Employee SET name=?, age=?, salary=? WHERE id=?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setDouble(3, salary);
            ps.setInt(4, id);

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Employee Updated ✅");
            else
                System.out.println("Employee Not Found ❌");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //DELETE
    public static void deleteEmployee(int id) {
        String query = "DELETE FROM Employee WHERE id=?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);

            int rows = ps.executeUpdate();

            if (rows > 0)
                System.out.println("Employee Deleted ✅");
            else
                System.out.println("Employee Not Found ❌");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //MAIN (for testing only)
    public static void main(String[] args) {

        insertEmployee("John", 28, 50000);
        insertEmployee("Emma", 30, 60000);

        viewEmployees();

        updateEmployee(1, "John Updated", 29, 55000);

        deleteEmployee(2);

        viewEmployees();
}
}
