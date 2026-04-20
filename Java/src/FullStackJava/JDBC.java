package FullStackJava;
import java.sql.*;
public class JDBC {
    public static void main(String[] args) {
        try{
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
              PreparedStatement ps = con.prepareStatement("select * from Sample");
              ResultSet rs = ps.executeQuery();
              ResultSetMetaData rsmd = rs.getMetaData();
              System.out.println(rsmd);
              System.out.println(rsmd.getColumnCount());
              System.out.println(rsmd.getColumnName(1));

              con.close();

//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeedb","root","root");
//            System.out.println("Connected");
//            String query = "UPDATE Sample SET name = ? WHERE id = ?";
//            PreparedStatement ps = con.prepareStatement(query);
//
//            ps.setString(1,"Payara");
//            ps.setInt(2,102);
            //ps.setString(3,"Navsari");
//            ps.executeUpdate();
            //To add multiple values simultaneously
//            String query = "INSERT INTO Sample(id, name, city) VALUES (?, ?, ?)";
//            PreparedStatement ps = con.prepareStatement(query);
//
//
//            ps.setInt(1, 1);
//            ps.setString(2, "Kushal");
//            ps.setString(3, "Vadodara");
//            ps.addBatch();
//
//
//            ps.setInt(1, 2);
//            ps.setString(2, "Meet");
//            ps.setString(3, "Dabhoi");
//            ps.addBatch();
//
//
//            ps.setInt(1, 3);
//            ps.setString(2, "Rakesh");
//            ps.setString(3, "Surat");
//            ps.addBatch();
//
//
//            ps.executeBatch();
            //To delete the record
//            String query = "Delete from Sample where id=?";
//            PreparedStatement st = con.prepareStatement(query);
//            st.setInt(1,101);
//            int row = st.executeUpdate();
//            System.out.println("Delete the record" + " " + row);

//            Statement st = con.createStatement();
//            st.addBatch("Insert into Sample (ID,Name,City) values (102, 'Shakti', 'Dakor')");
//            st.addBatch("Insert into Sample (ID,Name,City) values (103, 'Krunal', 'Ankleshwar')");
            //System.out.println("Done");
//            int[] result = st.executeBatch();
//            System.out.println(result.length);

            //int rows = st.executeUpdate(query);
            //System.out.println(rows);
           // con.close();

//            ResultSet rs = st.executeQuery("select * from employee");
//            System.out.println(rs);
//            while(rs.next()){
//                System.out.println(rs.getInt(1) + " " + rs.getString(2));
//            }

        }
        catch (Exception e){
            e.printStackTrace();
        }

    }
}
