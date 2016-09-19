package com.etsmtl.log635.labo1.investigation.model;

/**
 * Created by gnut3ll4 on 9/18/16.
 */
public class Lieu implements Comparable {
    private String name;

    public Lieu(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public int compareTo(Object o) {
        if (o instanceof Lieu) {
            return ((Lieu) o).getName().equals(name) ? 0 : -1;
        }
        return -1;
    }
}
