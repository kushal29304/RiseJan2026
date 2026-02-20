package FullStackJava;

public class Queue {
    int size=5;
    int Queue[] = new int[size];
    int rear=-1;
    int front=-1;

    void equeue(int value){
        if(rear==size-1){
            System.out.println("Queue is full");
        }
        else{
            if(front==-1){
                front = 0;
            }
            else{
                rear++;
                Queue[rear]=value;
                System.out.println("Insert the element"+ value);
            }
        }
    }
    void Dqueue() {
        if(front==-1){
            System.out.println("Queue is empty");
        }
    }
    void display(){
        if(front==-1 || front > rear)
        {
            System.out.println("Queue is empty");
        }
        else{
            for(int i= front; i<=rear;i++){

            }
        }
    }
    public static void main(String[] args){
        Queue q1=new Queue();
        q1.equeue(89);
        q1.equeue(65);
        q1.equeue(55);
        q1.equeue(45);
        q1.equeue(78);

        q1.Dqueue();
        q1.Dqueue();
    }
}
