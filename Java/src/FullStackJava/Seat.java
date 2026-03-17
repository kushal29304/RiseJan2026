package FullStackJava;

class Seat {
    String type;

    Seat(String type) {
        this.type = type;
    }

    double getExtraCharge() {
        switch (type.toLowerCase()) {
            case "balcony": return 100;
            case "recliner": return 250;
            default: return 0;
        }
    }
}
