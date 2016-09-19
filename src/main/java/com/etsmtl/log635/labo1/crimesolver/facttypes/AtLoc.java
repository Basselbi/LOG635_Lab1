package com.etsmtl.log635.labo1.crimesolver.facttypes;

import org.joda.time.DateTime;

/**
 * Created by Yves on 9/19/2016.
 */
public class AtLoc extends Fact {

    String location;
    DateTime timeFrom;
    DateTime timeTo;

    public AtLoc(String location, DateTime timeFrom, DateTime timeTo) {
        this.location = location;
        this.timeFrom = timeFrom;
        this.timeTo = timeTo;
    }
}
