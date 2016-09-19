package com.etsmtl.log635.labo1.crimesolver.facttypes;

import org.joda.time.DateTime;

/**
 * Created by Yves on 9/19/2016.
 */
public class Crime extends Fact {
    String location;
    String type;
    DateTime fromTime;
    DateTime toTime;
    DateTime exactTime;

    public Crime(String location, String type, DateTime fromTime, DateTime toTime, DateTime exactTime) {
        this.location = location;
        this.type = type;
        this.fromTime = fromTime;
        this.toTime = toTime;
        this.exactTime = exactTime;
    }
}
