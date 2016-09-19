package com.etsmtl.log635.labo1.investigation.model;

import java.util.ArrayList;

/**
 * Created by gnut3ll4 on 9/17/16.
 */
public class Personnage implements Comparable {
    private String nom;
    private boolean isDead;
    private boolean isSuspect;



    private String arme = null;

    public Personnage(String nom, boolean isDead, boolean isSuspect) {
        this.nom = nom;
        this.isDead = isDead;
        this.isSuspect = isSuspect;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public boolean isDead() {
        return isDead;
    }

    public void setDead(boolean dead) {
        isDead = dead;
    }

    public boolean isSuspect() {
        return isSuspect;
    }

    public void setSuspect(boolean suspect) {
        isSuspect = suspect;
    }

    public String getArme() {
        return arme;
    }

    public void setArme(String arme) {
        this.arme = arme;
    }


    @Override
    public int compareTo(Object o) {
        if (o instanceof Personnage) {
            return ((Personnage) o).getNom().equals(nom) ? 0 : -1;
        }
        return -1;

    }
}
