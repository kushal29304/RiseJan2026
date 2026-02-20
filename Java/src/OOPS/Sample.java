package OOPS;

public class Sample{
    int a=12;//instance variable
    static int x=90; //instance variable with static keyword
    Sample()
    {
        System.out.println("Constructor");
    }
    int mysample(int a, int b){
        System.out.println(a);
        System.out.println(b);
        return 1;
    }
    String mysample(String a,String b){
        System.out.println(a);
        System.out.println(b);
        return a;
    }
    static void staticmethod(){
        System.out.println("Hello Static Method");
    }
}