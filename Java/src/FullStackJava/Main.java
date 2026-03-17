package FullStackJava;

public class Main {
        public static void main(String[] args) {
            
            Movie movie = new Movie("Avengers");
            Ticket ticket = new Ticket("VIP", 12, "Sunday");
            Seat seat = new Seat("Recliner");
            Food food = new Food(12, 2, 1);
            Coupon coupon = new Coupon("SUPER10");

            Booking booking = new Booking();

            double finalBill = booking.calculateFinalBill(movie, ticket, seat, food, coupon);

            System.out.println("Final Bill: " + finalBill);

            // Cancellation Example
            Cancellation cancel = new Cancellation();
            System.out.println("Refund: " + cancel.getRefund(finalBill, 20));

        }
}

