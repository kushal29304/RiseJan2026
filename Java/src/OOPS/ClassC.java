package OOPS;

public class ClassC extends ClassB {
    ClassC(int a,int b){
        super(90,90);
        System.out.println(a-b);
    }
    void FeatureC1() {
        System.out.println("Feature from the Class C");
    }
    void FeatureC2(){
        System.out.println("Second feature of the class c");
    }
}
