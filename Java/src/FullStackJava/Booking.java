package FullStackJava;

class Booking {

    double calculateFinalBill(Movie movie, Ticket ticket, Seat seat, Food food, Coupon coupon) {

        double basePrice = ticket.getBasePrice();

        // Add seat charge
        basePrice += seat.getExtraCharge();

        // Weekend pricing
        basePrice = ticket.applyWeekend(basePrice);

        // Ticket total
        double ticketTotal = basePrice * ticket.quantity;

        // Apply ticket discount
        ticketTotal = ticket.applyDiscount(ticketTotal);

        // Food cost
        double foodCost = food.calculateFoodCost();

        // Group offer (Free popcorn)
        if (ticket.quantity > 10) {
            System.out.println("Free popcorn for all!");
            foodCost -= ticket.quantity * 150;
        }

        double subtotal = ticketTotal + foodCost;

        // Apply coupon
        subtotal = coupon.applyCoupon(subtotal);

        // GST + Fee
        double gst = subtotal * 0.18;
        double finalAmount = subtotal + gst + 50;

        return finalAmount;
    }
}
