package FullStackJava;

class Ticket {
    String type;
    int quantity;
    String day;

    Ticket(String type, int quantity, String day) {
        this.type = type;
        this.quantity = quantity;
        this.day = day;
    }

    double getBasePrice() {
        switch (type.toLowerCase()) {
            case "regular": return 200;
            case "premium": return 350;
            case "vip": return 500;
        }
        return 0;
    }

    double applyWeekend(double price) {
        if (day.equalsIgnoreCase("Saturday") || day.equalsIgnoreCase("Sunday")) {
            price += price * 0.20;
        }
        return price;
    }

    double applyDiscount(double total) {
        if (quantity >= 5 && quantity <= 8) return total * 0.90;
        else if (quantity <= 12) return total * 0.85;
        else if (quantity > 12) return total * 0.80;
        return total;
    }
}
