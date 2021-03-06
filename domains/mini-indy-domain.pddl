
(define (domain mini-indy-domain)
  (:types character location - object)
  (:predicates (alive ?character - character)
               (adj ?loc1 - location ?loc2 - location)
			   (at ?character - character ?location - location)
			   (high-up ?location - location)
			   (occupied ?location - location))


   (:action vacant-axiom
    :parameters (?character - character ?location - location)
    :precondition (forall ?character (not (at ?character ?location)))
    :effect (not (occupied ?location)))

  (:action move
    :parameters   (?character - character ?from - location ?to - location)
	:precondition (and  (adj ?from ?to)
                       (alive ?character)
                       (not (high-up ?to))
                       (at ?character ?from))
	:effect       (and (not (at ?character ?from))
                       (at ?character ?to)
                       (occupied ?to))
    :agents       (?character))

   (:action move-to-high-place
   :parameters   (?character - character ?from - location ?to - location)
    :precondition (and (adj ?from ?to)
                      (alive ?character)
                      (at ?character ?from)
                      (high-up ?to)
                      (not (occupied ?to)))
    :effect       (and (not (at ?character ?from))
                      (at ?character ?to)
                      (occupied ?to))
   :agents       (?character))



  (:action fall-from
    :parameters   (?victim - character ?from - location)
	:precondition (and (alive ?victim)
                       (at ?victim ?from)
					   (high-up ?from))
	:effect       (and (not (at ?victim ?from))
                       (not (alive ?victim))))


 )