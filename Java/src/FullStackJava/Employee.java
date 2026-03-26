package FullStackJava;

public abstract class Employee {
    abstract int calculatesalary();
    abstract void display();

    int id;
    String name;

    Employee(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
