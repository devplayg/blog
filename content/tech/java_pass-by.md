---
title: 'Java, pass-by-value 와 pass-by-reference'
draft: true
---

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Hello {
    public static void main(String[] args) {
        List<Person> people = new ArrayList<>(
                Arrays.asList(
                        new Person("A"),
                        new Person("B"),
                        new Person("C")
                )
        );
        System.out.println(people); // [name=A, name=B, name=C]


        updateList(people);
        System.out.println(people); // [name=A, name=B, name=C, name=D]
    }

    private static void updateList(List<Person> people) {
        people.add(new Person("D"));
        System.out.println(people); // [name=A, name=B, name=C, name=D]

        people =  new ArrayList<>(
                Arrays.asList(
                        new Person("X"),
                        new Person("Y"),
                        new Person("Z")
                )
        );
        System.out.println(people); // [name=X, name=Y, name=Z]

        people.add(new Person("NEW"));
        System.out.println(people); // [name=X, name=Y, name=Z, name=NEW]
    }
}



//### 객체 (pass-by-value)


//public class Hello {
//    public static void main(String[] args) {
//        Person person = new Person("A");
//        System.out.println(person.name); // A
//
//        updateObject(person);
//        System.out.println(person.name); // A
//    }
//
//    private static void updateObject(Person person) {
//        person = new Person("C");
//        System.out.println(person.name); // C
//    }
//}

// 객체 참조값은

//
//### 객체 (pass-by-reference)
//
//public class Hello {
//    public static void main(String[] args) {
//        Person person = new Person("A");
//        System.out.println(person.name); // A
//
//        updateName(person);
//        System.out.println(person.name); // B
//    }
//
//    private static void updateName(Person person) {
//        person.name = "B";
//    }
//}
//
// 객체 파라메타를 참조값으로 전달하는데, 객체 필드는 객체 참조값으로 업데이트 할 수 있다.

// Actually, Java is passing the apple object parameter as an object reference or we call it a pointer to the real object. The reason of apple is updated to washington is because Java is allowed to modify the object’s field name via the object



class Person {
    String name;

    Person(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "name="+name;
    }
}
