package FullStackJava;

public class FullTimeEmp extends Employee {
    int fixedsalary;
    public FullTimeEmp(int id, String name, int fixedsalary) {
        super(id, name);
        this.fixedsalary = fixedsalary;
    }
    int calculatesalary(){
        return  fixedsalary;
    }
    void display(){
        System.out.println("Id:"+id + " Name:" + name + " Salary:" + calculatesalary());
    }
}
