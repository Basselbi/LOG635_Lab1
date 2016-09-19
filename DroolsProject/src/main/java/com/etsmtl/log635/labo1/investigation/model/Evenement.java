package com.etsmtl.log635.labo1.investigation.model;

import org.joda.time.DateTime;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by gnut3ll4 on 9/18/16.
 */
public class Evenement {

    private String name;
    private Personnage personnage;
    private Lieu lieu;
    private DateTime datetimeFrom;
    private DateTime datetimeTo;
    private Objet objet;

    public Evenement() {
    }

    public Evenement(String name, Personnage personnage, Lieu lieu, DateTime datetimeFrom, DateTime datetimeTo, Objet objet) {
        this.name = name;
        this.personnage = personnage;
        this.lieu = lieu;
        this.datetimeFrom = datetimeFrom;
        this.datetimeTo = datetimeTo;
        this.objet = objet;
    }

    public Personnage getPersonnage() {
        return personnage;
    }

    public void setPersonnage(Personnage personnage) {
        this.personnage = personnage;
    }

    public Lieu getLieu() {
        return lieu;
    }

    public void setLieu(Lieu lieu) {
        this.lieu = lieu;
    }

    public DateTime getDatetimeFrom() {
        return datetimeFrom;
    }

    public void setDatetimeFrom(DateTime datetimeFrom) {
        this.datetimeFrom = datetimeFrom;
    }

    public DateTime getDatetimeTo() {
        return datetimeTo;
    }

    public void setDatetimeTo(DateTime datetimeTo) {
        this.datetimeTo = datetimeTo;
    }

    public Objet getObjet() {
        return objet;
    }

    public void setObjet(Objet objet) {
        this.objet = objet;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
