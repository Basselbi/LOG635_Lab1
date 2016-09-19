package com.etsmtl.log635.labo1.investigation;

import com.etsmtl.log635.labo1.helloworld.Message;
import com.etsmtl.log635.labo1.helloworld.MessageStatus;
import com.etsmtl.log635.labo1.investigation.model.*;
import org.joda.time.DateTime;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

import java.util.ArrayList;

/**
 * Created by gnut3ll4 on 9/17/16.
 */
public class Main {

    public static void main(String[] args) {
        KieServices ks = KieServices.Factory.get();
        KieContainer kc = ks.getKieClasspathContainer();
        KieSession ksession = kc.newKieSession("InvestigationKS");

        ArrayList<Evenement> evenements = new ArrayList<>();
//        evenements.add(new Evenement(
//                new Personnage("Zenon", true, false),
//                new Lieu("Pub"),
//                new DateTime(2015, 9, 22, 10, 0),
//                new DateTime(2015, 9, 22, 11, 0),
//                null
//        ));

        //(is-dead zenon)
        evenements.add(new Evenement(
                new Personnage("Zenon", true, false),
                null,
                null,
                null,
                null
        ));

//        (meurtre from-t 1 to-t 4)
        evenements.add(new Crime(
                null,
                null,
                new DateTime(2015, 9, 22, 1, 0),
                new DateTime(2015, 9, 22, 4, 0),
                null
        ));

//        (meurtre at-loc bluemountain)
        evenements.add(new Crime(
                null,
                new Lieu("bluemountain"),
                null,
                null,
                null
        ));

//        (at-loc denis bluemountain from-t 18 to-t 20)
        evenements.add(new Evenement(
                new Personnage("Denis", false, false),
                new Lieu("bluemountain"),
                new DateTime(2015, 9, 22, 18, 0),
                new DateTime(2015, 9, 22, 20, 0),
                null
        ));

//        (at-loc daniel bluemountain at-time 2)
        evenements.add(new Evenement(
                new Personnage("Daniel", false, false),
                new Lieu("bluemountain"),
                new DateTime(2015, 9, 22, 2, 0),
                null,
                null
        ));

//        (meurtre instr couteau)
        evenements.add(new Crime(
                null,
                null,
                null,
                null,
                new Objet("couteau")
        ));

//        (have daniel couteau)
        evenements.add(new Evenement(
                new Personnage("Daniel", false, false),
                null,
                null,
                null,
                new Objet("couteau")
        ));


        for (Evenement evenement : evenements) {
            ksession.insert(evenement);
        }

        Personnage suspect = new Personnage(null, false, false);
        ksession.insert(suspect);

        // and fire the rules
        ksession.fireAllRules();

        //regle 1 : eliminer des suspects le pers qui est décédé
        //regle 2 : eliminer des suspects les pers qui n'étaient pas sur les lieux du crime à l'heure du crime
        //

//        for (Evenement evenement : evenements) {
//            if (evenement.getPersonnage() != null && evenement.getPersonnage().isSuspect()) {
//                System.out.println(evenement.getPersonnage().getNom());
//            }
//        }

        System.out.println(suspect.isSuspect() ? suspect.getNom() : "personne");

        ksession.dispose();


    }


}
