package com.etsmtl.log635.labo1.crimesolver.facttypes;

import org.joda.time.DateTime;

/**
 * Created by Yves on 9/19/2016.
 */
public class AtLocObject extends AtLoc {

    String name;
    String type;

    public AtLocObject(String name, String type, String location, DateTime fromTime, DateTime toTime) {
        super(location,fromTime,toTime);
        this.name = name;
        this.type = type;
    }
}
