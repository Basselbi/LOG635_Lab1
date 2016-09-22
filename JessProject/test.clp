; Suppression des faits
(clear)


;;TODO nouveaux faits possibles
;; - Rajouter la date
;; -


; ==== FAITS ====
(deffacts faits
  (personnage zenon suspect);; TODO template default value suspect
  (personnage denis suspect)
  (personnage daniel suspect)
  (personnage fred suspect)
	(is-dead zenon)
	(meurtre from-t 1 to-t 4)
	(meurtre at-loc bluemountain)
  (at-loc fred bluemountain from-t 18 to-t 20)
	(at-loc denis lacleman from-t 18 to-t 20)
	(at-loc daniel bluemountain at-time 2)
	(meurtre instr couteau)
	(have daniel couteau)
)



; ==== REGLES ====

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

; (watch facts)
; (watch activations)
; (watch rules)

(reset)
(run)
