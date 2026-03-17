package FullStackJava;

class Cancellation {

    double getRefund(double amount, int hoursBefore) {
        if (hoursBefore > 24) return amount * 0.90;
        else if (hoursBefore >= 12) return amount * 0.50;
        else return 0;
    }
}
