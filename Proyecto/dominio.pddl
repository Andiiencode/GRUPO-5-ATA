(define (domain transporte-maletas-hotel)
  (:requirements :strips :typing)
  
  ;; Definición de tipos
  (:types localizacion robot maleta-grande maleta-pequenia)

  ;; Definición de predicados
  (:predicates
    (maleta-grande-en-localizacion ?g - maleta-grande ?l - localizacion)
    (maleta-pequenia-en-localizacion ?p - maleta-pequenia ?l - localizacion)
    (robot-en-localizacion ?r - robot ?l - localizacion)
    (robot-tiene-maleta-grande ?r - robot ?g - maleta-grande)
    (robot-tiene-maleta-pequenia ?r - robot ?p - maleta-pequenia)
    (posicion-pequenia-ocupada ?r - robot)
    (posicion-grande-ocupada ?r - robot)
  )

  ;; Definición de acciones
  (:action mover-robot
    :parameters (?r - robot ?origen - localizacion ?destino - localizacion)
    :precondition (and 
                    (robot-en-localizacion ?r ?origen)
                    (not (= ?origen ?destino))
                   )
    :effect (and 
              (not (robot-en-localizacion ?r ?origen))
              (robot-en-localizacion ?r ?destino)
            )
  )
  
   (:action coger-maleta-pequenia
    :parameters (?r - robot ?m - maleta-pequenia ?origen - localizacion)
    :precondition (and 
                    (robot-en-localizacion ?r ?origen)
                    (maleta-pequenia-en-localizacion ?m ?origen)
                    (not(robot-tiene-maleta-pequenia ?r ?m))
                    (posicion-grande-ocupada ?r)
                    (not (posicion-pequenia-ocupada ?r))
                   )
    :effect (and 
              (not (maleta-pequenia-en-localizacion ?m ?origen))
              (robot-tiene-maleta-pequenia ?r ?m)
              (posicion-pequenia-ocupada ?r)
            )
  )

  (:action coger-maleta-grande
    :parameters (?r - robot ?m - maleta-grande  ?origen - localizacion)
    :precondition (and 
                    (not(posicion-pequenia-ocupada ?r))
                    (robot-en-localizacion ?r ?origen)
                    (maleta-grande-en-localizacion ?m ?origen)
                    (not (posicion-grande-ocupada ?r))
               
                   )
    :effect (and 
              (not (maleta-grande-en-localizacion ?m ?origen))
               (posicion-grande-ocupada ?r)
              (robot-tiene-maleta-grande ?r ?m)
            )
  )

  (:action dejar-maleta-grande
    :parameters (?r - robot ?m - maleta-grande ?destino - localizacion)
    :precondition (and 
                    (robot-tiene-maleta-grande ?r ?m)
                    (robot-en-localizacion ?r ?destino)
                    (not (maleta-grande-en-localizacion ?m ?destino))
                    (posicion-grande-ocupada ?r)
                    (not (posicion-pequenia-ocupada ?r))
                   )
    :effect (and 
              (maleta-grande-en-localizacion ?m ?destino)
              (not(robot-tiene-maleta-grande ?r ?m))
            
               (not (posicion-grande-ocupada ?r))
            )
  )
  
  (:action dejar-maleta-pequenia
    :parameters (?r - robot ?m - maleta-pequenia ?destino - localizacion)
    :precondition (and 
                    (robot-tiene-maleta-pequenia ?r ?m)
                    (robot-en-localizacion ?r ?destino)
                    (not (maleta-pequenia-en-localizacion ?m ?destino))
                   
                    (posicion-pequenia-ocupada ?r)
                     (posicion-grande-ocupada ?r)
                   )
    :effect (and 
              (maleta-pequenia-en-localizacion ?m ?destino)
              (not(robot-tiene-maleta-pequenia ?r ?m))
            (not (posicion-pequenia-ocupada ?r))
            )
  )

 
)