package FullStackJava;

public class LightBulb extends SmartDevice{
    void deviceType(){

    }
    void performAction(String action){
        if(action.equalsIgnoreCase("On")){
            System.out.println("Fan is on");
        }
        else if(action.equalsIgnoreCase("Off")){
            System.out.println("Fan is off");
        }
        else{
            System.out.println("Invalid action");
        }

    }
}
