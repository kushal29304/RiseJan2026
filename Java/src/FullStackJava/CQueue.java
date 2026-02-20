package FullStackJava;

public class CQueue {
    int size=5;
    int Cqueue[]=new int[size];
    int front= -1;
    int rear = -1;

    void equeue(int value){
        if(front == (rear+1)% size){
            System.out.println("Queue is full");
        }
        else if(front == -1){
            front = 0;
            rear = 0;
            Cqueue[rear]=value;
            System.out.println("First Value inserted"+ value);
        }
        else {
            Cqueue[rear]=value;
            rear = (rear+1)%size;
            System.out.println("Value Inserted:"+ value);
        }
    }
    void Dqueue(){
        if(front==-1){
            System.out.println("Queue is empty ");
        }
    }
    void display(){
        if(front==-1){
            System.out.println("Queue is empty");
        }
        else{
            for(int i=front;i<=rear;i++){
                System.out.println(Cqueue[i]);
            }
        }

    }

    public static void main(String[] args){
        CQueue cq=new CQueue();
        cq.equeue(12);
        cq.equeue(35);
        cq.equeue(45);
        cq.equeue(17);
        cq.equeue(48);
        cq.equeue(26);
    }
}
