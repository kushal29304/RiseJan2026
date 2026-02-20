package OOPS;

public class Admin implements InterClass,Intterfaceclass {
    @Override
    public void abs_method() {
        System.out.println("Override the method from Interface");
    }
    public void myfunction(){
        System.out.println("Override the method from Interface");
    }
    public void mysample(){
        System.out.println("Same method in both Interface");
    }
}
