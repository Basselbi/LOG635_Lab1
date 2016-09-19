package com.etsmtl.log635.labo1.investigation.model;

import org.joda.time.DateTime;

/**
 * Created by gnut3ll4 on 19/09/16.
 */
public class Crime extends Evenement {

    public Crime(Personnage personnage, Lieu lieu, DateTime datetimeFrom, DateTime datetimeTo, Objet objet) {
        super(personnage, lieu, datetimeFrom, datetimeTo, objet);
    }
}
