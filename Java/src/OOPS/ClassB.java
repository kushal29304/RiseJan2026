package OOPS;

public class ClassB extends ClassA{
    ClassB()
    {
        super(11,78); //Class A constructor will be called
        System.out.println("Hello World");
    }

    public ClassB(int i, int i1) {
        super();
    }

    void FeatureB1(){
        System.out.println("Feature of the class B");
    }
    void FeatureB2(){
        System.out.println("Another feature of the class B");
    }
    void add(int x,int y){
        System.out.println("Class B"+" "+ x+y+ x*y);
        super.add(12,90);
    }
}
