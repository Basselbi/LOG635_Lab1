; Suppression des faits
(clear)


;;TODO nouveaux faits possibles
;; - Rajouter la date
;; -


; ==== FAITS ====
;; Daniel est le meurtrier
;; dimensions prises en compte : heure du crime, localisation, arme
(deffacts faits 
    (time 1)
    (time 2)
    (time 3)
    (time 4)
    (time 5)
    (time 6)
    (time 7)
    (time 8)
    (time 9)
    (time 10)
    (time 11)
    (time 12)
    (time 13)
    (time 14)
    (time 15)
    (time 16)
    (time 17)
    (time 18)
    (time 19)
    (time 20)
    (time 21)
    (time 22)
    (time 23)
    (time 24)
)


(deffacts faits
  (personnage zenon suspect);; TODO template default value suspect
  (personnage denis suspect)
  (personnage daniel suspect)
  (personnage fred suspect)
  (personnage jack suspect)
  (personnage joe suspect)
	(is-dead zenon)
	(meurtre from-t 1 to-t 4)
	(meurtre at-loc bluemountain)
  ;(meurtre instr couteau)
  (meurtre trace cigarette)
  (meurtre corps trace tranchant)

  (at-loc fred bluemountain from-t 18 to-t 20)
	(at-loc denis lacleman from-t 18 to-t 20)
	; (at-loc daniel bluemountain at-time 2)
 ;  (at-loc jack bluemountain at-time 2)
 ;  (at-loc joe bluemountain at-time 2)

  (at-loc daniel yellowmountain at-time 20)
  (at-loc joe greenmountain at-time 20)
  (at-loc jack redmountain at-time 20)

  (chemin yellowmountain bluemountain)
  (chemin greenmountain bluemountain)
  (chemin redmountain bluemountain)

  (indice cigarette indique fume)
  (arme couteau tranchant)

  (personnage daniel fume)
  (personnage joe fume)
	(have daniel couteau)
  (have jack couteau)
)



; ==== REGLES ====



(defrule position-possible
  (declare (salience 100))

(at-loc ?pers ?lieu at-time ?time)

(or 
        (chemin ?lieu ?lieu2)
        (chemin ?lieu2 ?lieu)
)

(time ?time2)
(test (= ?time2 (+ ?time 1)))

(not (at-loc-possible ?pers ?lieu2 at-time ?time2))

=>

(assert (at-loc-possible ?pers ?lieu2 at-time (+ ?time 1)))
(printout t ?pers " at-loc-possible " ?lieu2 crlf)

)


(defrule un-seul-suspect
  (declare (salience 62))
  ?c <- (accumulate (bind ?count 0)                        ;; initializer
                (bind ?count (+ ?count 1))                    ;; action
                ?count                                        ;; result
                (personnage ? suspect))  ;; CE
   (test (= ?c 1))
   (personnage ?pers suspect)
  =>
  (printout t "Il n'y a plus qu'un suspect, c'est " ?pers crlf)
  (halt)
)

(defrule trace-sur-les-lieux-du-crime
	(declare (salience 44))
  (meurtre trace ?indice)
  (indice ?indice indique ?conclusion)
  ?f <- (personnage ?pers suspect)
  (not (personnage ?pers ?conclusion))
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule non-present-sur-les-lieux-du-crime
	(declare (salience 40))
  (meurtre at-loc ?loc)
  (at-loc ?pers ~?loc $?)
  ?f <- (personnage ?pers suspect)
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule pas-manipule-arme-crime
	(declare (salience 40))
  (personnage ?pers suspect)
  (meurtre instr ?arme)
  (not (have ?pers ?arme))
  ?f <- (personnage ?pers suspect)
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule non-present-heure-crime-from-to
	(declare (salience 41))
  (meurtre at-loc ?loc)
  (meurtre from-t ?from-meurtre to-t ?to-meurtre)
  (at-loc ?pers ?loc from-t ?from-suspect to-t ?to-suspect)
  (test
    (or
       (> ?from-meurtre ?to-suspect)
       (< ?to-meurtre ?from-suspect))
  )
  ?f <- (personnage ?pers suspect)
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule non-present-heure-crime-at-time
	(declare (salience 41))
  (meurtre at-loc ?loc)
  (meurtre from-t ?from-meurtre to-t ?to-meurtre)
  (at-loc ?pers ?loc at-time ?at-time-suspect)
  (test
    (or
      (> ?from-meurtre ?at-time-suspect)
      (< ?to-meurtre ?at-time-suspect)
    )
  )
  ?f <- (personnage ?pers suspect)
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule victime-non-suspecte
	(is-dead ?pers)
   ?f <- (personnage ?pers suspect)
  =>
  (retract ?f)
  (assert (personnage ?pers non-suspect))
  (printout t ?pers " n'est plus suspecté"  crlf)
)

(defrule est-possiblement-arme-crime 
  (declare (salience 50))
  
  (meurtre corps trace ?blessure)
  (arme ?item ?blessure)
=>
  (assert (meurtre instr ?item))
  (printout t  "L'arme " ?item " est possiblement relie au meurtre." crlf)
)

 ;(watch facts)
 ;(watch activations)
 ;(watch rules)

(reset)
(run)
