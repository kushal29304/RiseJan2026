package FullStackJava;

import java.util.ArrayList;
import java.util.List;

public class Listquestions {
    public static void main(String[] args) {

        List<Integer> l1 = new ArrayList<>();
        List<Integer> l2 = new ArrayList<>();
        l1.add(11);
        l1.add(12);
        l1.add(11);
        l1.add(56);
        l1.add(65);
        l1.add(89);
        l2.add(56);
        l2.add(65);
        l2.add(89);
        System.out.println(l1);

        //1.create list having string values like names from which you have to fetch
        // that start from h and ends with i should be the output.

        List<String> names = new ArrayList<>();

        names.add("Himanshi");
        names.add("Harsh");
        names.add("Hiteshi");
        names.add("Amit");
        names.add("Himani");
        names.add("Ravi");
//
//        for (int i = 0; i < names.size(); i++) {
//            String name = names.get(i).toLowerCase();
//
//            if (name.startsWith("h") && name.endsWith("i")) {
//                System.out.println(names.get(i));
//            }
//        }

        //2.Insert an element at a specific index in your list
//        l1.add(3,99);
//        System.out.println(l1);

        //3.Find the maximum and minimum element from the list

//        l1.sort(null);
//        System.out.println(l1);
//
//        System.out.println(l1.getFirst());
//        System.out.println(l1.getLast());

        //4.Sort a list in descendiing and ascending order

//        l1.sort(null); // Ascending order
//        System.out.println(l1);
//
//        System.out.println(l1.reversed()); // Descending

        //5.Remove duplicate values from the list

        //6.Count frequency of each element in the list

        //7.Merge 2 lists into 1
//        l1.addAll(l2);
//        System.out.println(l1);

        //8.Convert all String into the uppercase
        for (int i = 0; i < names.size(); i++) {
            names.set(i, names.get(i).toUpperCase());
        }
        System.out.println(names);
    }
}
