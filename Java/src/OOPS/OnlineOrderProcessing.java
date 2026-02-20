package OOPS;

public class OnlineOrderProcessing {

    static class OrderItem {
        String name;
        double price;
        int quantity;

        OrderItem(String name, double price, int quantity) {
            this.name = name;
            this.price = price;
            this.quantity = quantity;
        }

        double totalPrice() {
            return price * quantity;
        }
    }

    static class Order {
        static double platformFee;
        static double taxRate;
        static int totalOrders;

        static {
            platformFee = 20.0;
            taxRate = 0.18;
        }

        String customerName;
        OrderItem[] items;
        int itemCount;

        Order(String customerName, int capacity) {
            this.customerName = customerName;
            this.items = new OrderItem[capacity];
            totalOrders++;
        }

        Order(String customerName, String[] itemNames, double[] prices, int[] quantities) {
            this(customerName, minLength(itemNames, prices, quantities));
            for (int i = 0; i < items.length; i++) {
                addItem(itemNames[i], prices[i], quantities[i]);
            }
        }

        void addItem(String name, double price) {
            addItem(name, price, 1);
        }

        void addItem(String name, double price, int quantity) {
            if (itemCount >= items.length) {
                System.out.println("Cannot add more items. Order capacity reached.");
                return;
            }
            items[itemCount] = new OrderItem(name, price, quantity);
            itemCount++;
        }

        double calculateSubtotal(double... prices) {
            double sum = 0.0;
            for (double price : prices) {
                sum += price;
            }
            return sum;
        }

        double calculateSubtotalFromItems() {
            double[] totals = new double[itemCount];
            for (int i = 0; i < itemCount; i++) {
                totals[i] = items[i].totalPrice();
            }
            return calculateSubtotal(totals);
        }

        double calculateTotalBill() {
            double subtotal = calculateSubtotalFromItems();
            double tax = subtotal * taxRate;
            return subtotal + tax + platformFee;
        }

        void printBill() {
            System.out.println("Customer: " + customerName);
            for (int i = 0; i < itemCount; i++) {
                OrderItem item = items[i];
                System.out.println((i + 1) + ". " + item.name + " x" + item.quantity + " = " + item.totalPrice());
            }
            double subtotal = calculateSubtotalFromItems();
            double tax = subtotal * taxRate;
            System.out.println("Subtotal: " + subtotal);
            System.out.println("Tax (18%): " + tax);
            System.out.println("Platform Fee: " + platformFee);
            System.out.println("Total Bill: " + (subtotal + tax + platformFee));
            System.out.println();
        }

        static int getTotalOrders() {
            return totalOrders;
        }

        static int minLength(String[] itemNames, double[] prices, int[] quantities) {
            int min = itemNames.length;
            if (prices.length < min) {
                min = prices.length;
            }
            if (quantities.length < min) {
                min = quantities.length;
            }
            return min;
        }
    }

    public static void main(String[] args) {
        Order order1 = new Order("Kushal", 5);
        order1.addItem("Burger", 120.0);
        order1.addItem("Pizza", 250.0, 2);
        order1.addItem("Cola", 40.0);
        order1.printBill();

        String[] names = {"Pasta", "Sandwich", "Coffee"};
        double[] prices = {180.0, 90.0, 70.0};
        int[] quantities = {1, 2, 1};
        Order order2 = new Order("Asha", names, prices, quantities);
        order2.printBill();

        System.out.println("Total orders placed: " + Order.getTotalOrders());
    }
}
