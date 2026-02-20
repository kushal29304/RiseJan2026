package FullStackJava;

public class Thermostat extends SmartDevice{
    int a;
    void deviceType(){

    }
    void performAction(String action){
        a=Integer.parseInt(action);
        getTemp(a);


    }
    void getTemp(int temp){
        if(temp > 20){
            System.out.println("The temperature is set");
        }
        else if((temp > 20) && (temp < 30)){
            System.out.println("The temperature is set");
        }
        else{
            System.out.println("It is getting set");
        }
    }

}
