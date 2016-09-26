; Suppression des faits
(clear)


;; REGLE POUR PRENDRE UN ITEM
(defrule prendre-item

(declare (salience 15) )

?f1 <- (item ?item1 at-loc ?loc1)
(at-loc ?person1 ?loc1)
(not (exists (have-item ?person1 ?item2)))

=>

(retract ?f1)
(assert (have-item ?person1 ?item1))
(printout t ?person1 " a pris l'item " ?item1 crlf)

)

(defrule echanger-item

?f2 <- (item ?item1 at-loc ?loc1)
(at-loc ?person1 ?loc1)
(exists (have-item ?person1 ?item2))
?f1 <- (have-item ?person1 ?item2)
(test (<> ?item1 ?item2))

=>

;(retract ?f1)
;(retract ?f2)
(assert (item ?item2 at-loc ?loc1))
(assert (have-item ?person1 ?item1))
(printout t ?person1 " a echanger son item pour " ?item1 crlf)

)

(defrule prendre-item-personne

(at-loc ?person1 ?loc1)
(at-loc ?person2 ?loc1)
?f1 <- (have-item ?person2 ?item1)
(test (<> ?person1 ?person2))

=>

(printout t ?person1 " a pris l'item " ?item1 " de " ?person2 crlf)

)


;;REGLE POUR CHANGER DE LIEU
(defrule changer-de-lieu

(declare (salience 10) )

?f <- (at-loc ?person1 ?loc1)
(at-loc ?person1 ?loc2)
(test (<> ?loc1 ?loc2))

=>

(retract ?f)
(printout t ?person1 " a changer de place pour aller a " ?loc2 crlf)

)

;; REGLE POUR ALLER A UN ENDROIT TU DOIT PASSER PAR UN ENDROIT
(defrule aller-a-un-endroit 

(going-to ?person1 at-loc ?loc-future at-time ?time)
(location ?loc-future ?passer-part)

=>

(assert (going-to ?person1 at-loc ?passer-part at-time ?time))
(printout t ?person1 " doit passer par " ?passer-part crlf)

)

(defrule passer-par-un-endroit

(going-to ?person1 at-loc ?loc-future at-time ?time)
(location ?loc-voulu ?loc-future)
(not (exists (location ?loc-future ?passer-part)))

=>

(printout t ?person1 " vient de passer par " ?loc-future crlf)
(assert (at-loc ?person1 ?loc-voulu))

)


;;REGLE LORSQU'UNE PERSONNE PASSE A LENDROIT DU MEURTRE
(defrule passer-par-lieu-crime   

(going-to ?person1 at-loc ?loc at-time ?time)
(crime ?loc from-t ?t1 to-t ?t2 )
(test (< ?t1 ?time))
(test (> ?t2 ?time))

=>

(printout t ?person1 " est suspect !" crlf)
(assert (is-suspect ?person1))

)

;;REGLE SUR ARME DU CRIME
(defrule est-possiblement-arme-crime 

?f1 <- (arme ?item blessure ?blessure arme-possible FALSE)
(meurtre ?person blessure ?blessure)

=>

(retract ?f1)
(assert (arme ?item blessure ?blessure arme-possible TRUE))
(printout t  "L'arme " ?item " est possiblement relie au meurtre." crlf)

)


;; FACT FORMAT
;; (at-loc ?personne ?lieu )
;; (at-loc ?personne ?lieu from-t ?t1 to-t ?t2)
;; (item ?nom at-loc ?lieu)
;; (location ?lieu ?lieu-passer-part)
;; (going-to ?personne at-loc ?loc at-time ?temps)
;; (crime ?lieu from-t ?t1 to-t ?t2)

;(assert (meurtre bassel blessure coupure))
;(assert (arme couteau blessure coupure arme-possible FALSE))
;(assert (arme marteau blessure trou arme-possible FALSE))

(assert (at-loc bassel hallb))
(assert (at-loc joseph hallb))
(assert (at-loc joseph cafeteria))
(assert (item marteau at-loc hallb))
(assert (item couteau at-loc cafeteria))
(assert (have-item bassel dildo))

;(assert (at-loc bassel cafeteria))
;(assert (have-item joseph couteau FALSE))
;(assert (have-item bassel marteau FALSE))


;(assert (location hallb cafeteria))
;(assert (going-to joseph at-loc hallb at-time 9))
;(assert (crime cafeteria from-t 6 to-t 8))

; (watch facts)
; (watch activations)
; (watch rules)

(run)