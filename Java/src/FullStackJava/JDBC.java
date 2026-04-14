package FullStackJava;
import java.sql.*;
public class JDBC {
    public static void main(String[] args) {
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
            System.out.println("Connected");
        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}
