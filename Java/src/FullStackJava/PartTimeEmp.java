package FullStackJava;

public class PartTimeEmp extends Employee{
    int hours;
    int rate;
    public PartTimeEmp(int id, String name, int hours, int rate) {
        super(id, name);
        this.hours = hours;
        this.rate = rate;
    }
    int calculatesalary(){
        return hours * rate;
    }
    void display(){
        System.out.println("Id:"+id + " Name:" + name + " Salary:" + calculatesalary());
    }
}
