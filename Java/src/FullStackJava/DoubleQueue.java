package FullStackJava;

import java.util.Arrays;

public class DoubleQueue {
    int size=5;
    int Dqueue[]=new int[size];
    int front = -1;
    int rear = -1;

    void insterrear(int value){
        if((front==0 && rear==size-1) || (front==rear+1)){
            System.out.println("Queue is full");
        }
        else{
            if(front==-1){
                front=0;
            }
            rear++;
            Dqueue[rear]=value;
            System.out.println("Values from rear:" + value);
        }
    }
    void deletefront(){
        if(front==-1){
            System.out.println("Queue is empty");
        }
        else{
            System.out.println(Dqueue[front]);
            front++;
        }
    }
    void insertfront(int value){
        if((front==0 && rear==size-1) || (front==rear+1)){
            System.out.println("Queue id full");
        }
        else if(front==0){
            front = size-1;
            Dqueue[front]=value;
        }
        else{
            Dqueue[rear]=value;
            front--;
        }
    }
    public static void main(String[] args){
        DoubleQueue d1=new DoubleQueue();
        d1.insterrear(12);
        d1.insterrear(23);
        d1.insterrear(87);
        d1.insterrear(90);
        d1.insterrear(110);
        d1.insterrear(10);

        d1.deletefront();
        d1.deletefront();
        d1.deletefront();
        d1.deletefront();
        d1.deletefront();
        d1.deletefront();

        d1.insterrear(10);
    }
}
