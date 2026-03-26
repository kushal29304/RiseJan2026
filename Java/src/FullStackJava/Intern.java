package FullStackJava;

public class Intern extends Employee{
    int stipen;
    int calculatesalary(){
        return stipen;
    }
    Intern(int id, String name,int stipen){
        super(id,name);
        this.stipen = stipen;
    }
    void display(){
        System.out.println("ID:"+id + " Name:" + name + " Salary:" + calculatesalary());
    }
}
