package com.etsmtl.log635.labo1.crimesolver.facttypes;

import org.joda.time.DateTime;

/**
 * Created by Yves on 9/19/2016.
 */
public class AtLocPerson extends AtLoc {

    String name;

    public AtLocPerson(String location, DateTime timeFrom, DateTime timeTo, String name) {
        super(location, timeFrom, timeTo);
        this.name = name;
    }
}
