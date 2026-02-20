package OOPS;

import java.util.HashMap;

//Create a coffee class coffee details type,size quantity and then calculate the price and display the order
public class Coffee {

    int cupser=0;
    String coffeetype;
    String Size;
    int quantity;
    static int totalCups = 0;

    double basePrice;
    double sizePrice;

    Coffee(String coffeetype)
    {
        this.coffeetype=coffeetype;
        this.Size="Small";
        this.quantity=1;
        cupser += quantity;

        this.basePrice = 70;   // default price
        this.sizePrice = 0;

        totalCups += quantity;
    }
    Coffee(String coffeetype,int quantity){
        this.coffeetype=coffeetype;
        this.Size="Medium";
        this.quantity=quantity;
        cupser += quantity;

        this.basePrice = 70;
        this.sizePrice = 20;

        totalCups += quantity;

    }
    Coffee(String coffeetype,int quantity,String size) {
        this.coffeetype=coffeetype;
        this.Size=size;
        this.quantity=quantity;
        cupser = cupser + quantity;

        this.basePrice = 100;
        this.sizePrice = 30;

        totalCups += quantity;
    }

    double calculateBill() {
        return (basePrice + sizePrice) * quantity;
    }

    void displayOrder() {
        System.out.println("Coffee Type : " + this.coffeetype);
        System.out.println("Size        : " + this.Size);
        System.out.println("Quantity    : " + this.quantity);
        System.out.println("Bill Amount : ₹" + calculateBill());
        System.out.println("Total Cups  : " + totalCups);
        System.out.println("----------------------");
    }

}
