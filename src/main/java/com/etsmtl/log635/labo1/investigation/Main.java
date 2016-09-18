package com.etsmtl.log635.labo1.investigation;

import com.etsmtl.log635.labo1.helloworld.Message;
import com.etsmtl.log635.labo1.helloworld.MessageStatus;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

/**
 * Created by gnut3ll4 on 9/17/16.
 */
public class Main {

    public static void main(String[] args) {
        KieServices ks = KieServices.Factory.get();
        KieContainer kc = ks.getKieClasspathContainer();
        KieSession ksession = kc.newKieSession("InvestigationKS");


        // The application can insert facts into the session
        final Message message = new Message();
        message.setMessage( "Hello World" );
        message.setStatus( MessageStatus.HELLO );
        ksession.insert( message );

        // and fire the rules
        ksession.fireAllRules();

    }




}
