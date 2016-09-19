package com.etsmtl.log635.labo1.crimesolver;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import com.etsmtl.log635.labo1.crimesolver.facttypes.*;

import java.util.ArrayList;

/**
 * Created by Yves on 9/19/2016.
 */
public class CrimeSolver {

    public static void main(String[] args) {
        KieServices ks = KieServices.Factory.get();
        KieContainer kc = ks.getKieClasspathContainer();
        KieSession ksession = kc.newKieSession("CrimeSolverKS");


        ArrayList<Fact> facts = new ArrayList<>();



        for (Fact fact : facts) {
            ksession.insert(fact);
        }

        ksession.fireAllRules();

    }


}
