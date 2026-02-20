package OOPS;
enum Foodtype{
    Veg,
    Non_Veg,
    Vegan;
}
public class Foodorder {
    Foodtype foodtype;
    int order_Id;
    String[] items;

    Foodorder(int order_Id, Foodtype foodtype, String[] items) {
        this.order_Id=order_Id;
        this.foodtype= foodtype;
        this.items = items;

    }
    double calculateprice(double ...price){
        double total = 0;
        for(double i : price) {
            total = total + i;
        }
        return total;
    }
    public void display()
    {
        System.out.println("Order ID"+" "+ order_Id);
        System.out.println("Foodtype"+" "+foodtype);
        for (String i : items) {
            System.out.println(i);
        }
        System.out.println("Total Bill is:"+ " "+ calculateprice(11,67,90));
    }

}
