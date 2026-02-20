package OOPS;
public class Sample1 {
    public static void main(String[] args){
        Sample s1 = new Sample();
        s1.mysample("Hello","Java");
        //s1.mysample("Hello","Java");
        //s1.mysample(55,65);
        //Sample s2=new Sample();
        //s2.mysample(45,85);
        //System.out.println(s2.a);
        //System.out.println(Sample.x); //No need to create object for the static variable
        s1.a=90;// you can call it by just adding the classname.variable name
        System.out.println(s1.a);
        Sample.x=23;
        System.out.println(Sample.x);
        Sample s2=new Sample();
        System.out.println(s2.a);
    }
} //Create a coffee class coffee details type,size quantity and then calculate the price and display the order