package OOPS;

public class Movie {
    String Moviename;
    int seats;
    int priceperseat;

    Movie(String Moviename, int seats) {
        this.Moviename = Moviename;
        this.seats = seats;
        priceperseat = 200;
    }

    double calculatebill() {
        return seats * priceperseat;
    }

    void display() {
        System.out.println(Moviename);
        System.out.println(seats);
        System.out.println(calculatebill());
    }
}