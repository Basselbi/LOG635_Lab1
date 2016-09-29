(deffacts place-temperature
(crimeScene temperature 13degree)
)
(deffacts place-ambiance
(crimeScene ambiance humide)
)


(defrule crimeScene-temperature-ambiance
(crimeScene temperature  ?temperature)
(crimeScene ambiance  ?ambiance)
=>
(printout t "la temperature du lieu du crime est de  " ?temperature crlf)
(printout t "il faisait " ?ambiance crlf)
(assert (place-temperature ?temperature)))
(assert (place-ambiance ?ambiance)))
