package FullStackJava;
import java.util.HashSet;
import java.util.Set;

public class Setquestions {

    public static void main(String[] args) {
        java.util.Set<Integer> c1 = new HashSet<>();
        java.util.Set<Integer> c2 = new HashSet<>();
        c1.add(60);
        c1.add(70);
        c1.add(20);
        c1.add(40);
        c1.add(10);
        c1.add(60); //Duplicates are ignored

        c2.add(60);
        c2.add(55);
        c2.add(20);
        c2.add(46);

        // 1.You have 2 sets from both of those sets you have to find the common values(intersection)
//        c1.retainAll(c2);
//        System.out.println(c1);

        // 2. Count unique elements present in the set
        System.out.println(c1.size());

        // 3. Check weather the given number is inside the set
        System.out.println(c1.contains(60));

        // 4. Find all unique elements from 2 sets
        Set<Integer> union = new HashSet<>(c1);
        union.addAll(c2);
        System.out.println("All unique elements: " + union);

        // 5. Check if one set is a subset of another set
    }
}
