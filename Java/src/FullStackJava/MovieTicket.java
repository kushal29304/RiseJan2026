package FullStackJava;

class MovieTicket {
        String movieName;
        String ticketType;
        int numberOfTickets;

        double pricePerTicket;

        // Constructor
        MovieTicket(String movieName, String ticketType, int numberOfTickets) {
            this.movieName = movieName;
            this.ticketType = ticketType;
            this.numberOfTickets = numberOfTickets;
            setTicketPrice();
        }

        // Method to set ticket price based on type
        void setTicketPrice() {
            switch (ticketType.toLowerCase()) {
                case "regular":
                    pricePerTicket = 200;
                    break;
                case "premium":
                    pricePerTicket = 350;
                    break;
                case "vip":
                    pricePerTicket = 500;
                    break;
                default:
                    System.out.println("Invalid Ticket Type!");
                    pricePerTicket = 0;
            }
        }

        // Calculate total bill
        void calculateBill() {
            double subtotal = pricePerTicket * numberOfTickets;
            double gst = subtotal * 0.18;
            double bookingFee = 50;
            double finalAmount = subtotal + gst + bookingFee;

            // Output
            System.out.println("Movie: " + movieName);
            System.out.println("Ticket Type: " + ticketType);
            System.out.println("Tickets: " + numberOfTickets);
            System.out.println("Subtotal: " + subtotal);
            System.out.println("GST: " + gst);
            System.out.println("Booking Fee: " + bookingFee);
            System.out.println("Final Amount: " + finalAmount);
        }
    }




