package FullStackJava;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Array {
    public static void main(String[] args) {

        int array[] = new int[5];
        int arr[]= {12,10,15,9,17};
        array[0]=12;
        array[1]=13;
        array[2]=14;
        array[3]=15;
        array[4]=16;
//        System.out.println(Arrays.toString(array));
        //System.out.println(Arrays.binarySearch(array,90));
        //Whenever I search for the arrays value using binary search why it is giving values in minus
        //Sort and parallel sort difference in array methods
        //Array list strings are mutable or immutable
        //Generics
//        Arrays.sort(arr);
//        System.out.println(Arrays.toString(arr));
//        System.out.println(Arrays.compare(array,arr));
//        System.out.println(Arrays.copyOf(array,1));
//        int arr2[]= Arrays.copyOf(array,5);
//        System.out.println(Arrays.toString(arr2));
//
//        int arr3[]=Arrays.copyOfRange(arr,0,4); //4th index is not included
//        System.out.println(Arrays.toString(arr3));
//
//        Arrays.fill(array, 9);
//        System.out.println(Arrays.toString(array));

//        Arrays.parallelSort(array);
//        System.out.println(Arrays.toString(array));

//        System.out.println(array[2]);
//        for(int i:array){
//            System.out.println(i);
//        }

//        String a="Helloooo";
//        for(String x:a){
//            System.out.println(x);
//        }
//        System.out.println(array.length);
//        System.out.println(array.equals(arr));
        /* I want to check that 80 is there inside the array or not */

        List<Integer> l1 = new ArrayList<>();
        List<Integer> l2 = new ArrayList<>();
        List<Integer> l3 = new ArrayList<>();
        l1.add(11);
        l1.add(12);
        l1.add(11);
        l1.add(56);
        l1.add(65);
        l1.add(89);
        l2.add(56);
        l2.add(65);
        l2.add(89);
//        System.out.println(l1);
//        l1.addFirst(2);
//        System.out.println(l1);
//        l1.addLast(9);
//        System.out.println(l1);
//        l1.addAll() try it
//        System.out.println(l1.get(2));
//        System.out.println(l1.getFirst());
//        System.out.println(l1.getLast());
//        System.out.println(l1.contains(12));
//        System.out.println(l1.containsAll(l2));
        //Contains all mens l1 contains all the elements similar to l2

//        System.out.println(l1.equals(l2));
        //Equals check that both of the lists must me similar

//        System.out.println(l1.indexOf(11));
//        System.out.println(l1.lastIndexOf(11));
//        System.out.println(l1.remove(2));
//        System.out.println(l1);
//        l1.removeFirst();
//        System.out.println(l1);
//        l1.removeLast();
//        System.out.println(l1);

        System.out.println(l1);
        System.out.println(l2);
//        l1.retainAll(11);
//        System.out.println(l1);
        System.out.println(l1.reversed());
        l1.sort(null);
        System.out.println(l1);
        System.out.println(l1.size());
        l1.toArray();
        Object[] list1 = l1.toArray();
        System.out.println(l1);
//
//        System.out.println(l3.isEmpty());

        //The extended version of array is collections
        //1.create list having string values like names from which you have to fetch that start from h and ends with i should be the output
        //2.Insert an element at a specific index in your list
        //3.Find the maximum and minimum element from the list
        //4.Sort a list in descendiing and ascending order
        //5.Remove duplicate values from the list
        //6.Count frequency of each element in the list
        //7.Merge 2 lists into 1
        //8.Convert all String into the uppercase



    }
}
