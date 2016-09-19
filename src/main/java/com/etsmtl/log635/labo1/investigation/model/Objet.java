package com.etsmtl.log635.labo1.investigation.model;

/**
 * Created by gnut3ll4 on 9/17/16.
 */
public class Objet implements Comparable {

    private String name;
    private boolean armeDuCrime = false;

    public Objet(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isArmeDuCrime() {
        return armeDuCrime;
    }

    public void setArmeDuCrime(boolean armeDuCrime) {
        this.armeDuCrime = armeDuCrime;
    }

    @Override
    public int compareTo(Object o) {
        if (o instanceof Objet) {
            return ((Objet) o).getName().equals(name) ? 0 : -1;
        }
        return -1;
    }
}
