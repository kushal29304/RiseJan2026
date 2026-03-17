package FullStackJava;

class Coupon {
    String code;

    Coupon(String code) {
        this.code = code;
    }

    double applyCoupon(double total) {
        if (code.equals("MOVIE100")) return total - 100;
        else if (code.equals("MOVIE200")) return total - 200;
        else if (code.equals("SUPER10")) return total * 0.90;

        return total;
    }
}
