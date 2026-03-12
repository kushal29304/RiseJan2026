package FullStackJava;

public class Begin {
    public static void main(String[] args){
        // naming convention should be good and try to add comments to recall that the variable is used for which purpose
//        byte a=100;
//        short b=1000;
//        int a1=123456789;
//        long name=147852;
//        long n_a_m_e = 123654;
//        // variable can be named like n_a_m_e also you should not leave space and if you want to add space then add _(underscore)
//        char x='A';
//        boolean y=true;
//        boolean z=false;
//        String Place="Hello I am in Vadodara";
//        System.out.println(a+b);
//        System.out.println(b);
//        System.out.println(a1);
//        System.out.println(name);
//        System.out.println(x);

//        String a= "Indian";
//        int age=19;
//        if(a == "Indian"){
//            System.out.println("The person is the citizen of India");
//            if ( age>18){
//                System.out.println("Eligible to vote");
//            }
//            else{
//                System.out.println("Not eligible to vote");
//            }
//        }
//        else {
//            System.out.println("You are not a citizen of India so you cannot vote");
//        }
//
//        String c="Present";
//        String d="Absent";
//        int marks=45;
//        if(c=="Present"){
//            System.out.println("You can check your result");
//            if (marks>=35){
//                System.out.println("Pass");
//            }
//            else{
//                System.out.println("Fail");
//            }
//        }
//        else {
//            System.out.println("You are absent during the exam so your result is unavailable");
//        }

        //Stack and heap memory difference
        String a="Kushal Parikh";
        String s1=new String("Kushal Parikh");
        //Difference between creating string in this two different methods
        //Why there is this much options related to index for string like for what purpose it is given
        System.out.println(a.concat(" He is the best boy"));
//        System.out.println(a.charAt(1));
//        System.out.println(a.length());
//        System.out.println(a.indexOf("a"));
//        System.out.println(a.lastIndexOf("a"));
//        System.out.println(a.toLowerCase());
//        System.out.println(a.toUpperCase());
//        System.out.println(a.trim());
//        System.out.println(a.equals(s1));
//        System.out.println(a.equalsIgnoreCase(s1));
//        //Difference between .equals() and == methods
//        System.out.println(a.compareTo(s1));
//        System.out.println(a.contains("Kushal"));
//        char[] arr = new char[0];
//        a.getChars(1,6,arr,3);
//        System.out.println(arr[0]);
//        StringBuilder sb = new StringBuilder(a);
//        System.out.println(sb.reverse());
//        StringBuilder s3 = new StringBuilder("Hello Java");
//        StringBuilder s4 = new StringBuilder("Hello Java");
//        System.out.println(s3.reverse());
//        //System.out.println(s3 + " " + "Hello Python");
//        System.out.println(s3.append("Hello Python"));
//        System.out.println(s3);
//        s3.append(12);
//        System.out.println(s3);
//        //Find out about this
//        //s3.append(null,0,0);
//        System.out.println(s3.compareTo(s4));
//        //nested if contains if condition under the if statement
//        s3.delete(2,6); //In it the ending number(6) is not considered so it will consider 5 as the ending index
//        System.out.println(s3);
//        s3.deleteCharAt(3);
        String k1 = "I am Learning Java";
        String k2 = "I am Learning Java";
        StringBuilder j1 = new StringBuilder("Hello Java");
        StringBuilder j2 = j1;
        System.out.println(k1.equals(k2));
        System.out.println(j2.equals(j1));
        // shallow copy deep copy
        j1.insert(3,"Python");
    }
}
