package FullStackJava;

public class ExceptionClass {
        public static void main (String args[]){
            try {
                try {
                    int[] a = new int[5];
                    System.out.println(a[10] = 90);
                    throw new Exception("My exception");
                } catch (ArrayIndexOutOfBoundsException e) {
                    System.out.println("Index out of bounds");
                }
                try {
                    int b=10;
                    int c=25;
                    System.out.println(b+c);
                }
                catch (Exception e) {

                }
            } catch (Exception e) {
                System.out.println("Exception");
            }
        }    //Types of exceptions available in java
}
