(define (problem transporte-maletas-hotel)
  (:domain transporte-maletas-hotel)
  
  ;; Definición de objetos
  (:objects 
     maleta2 maleta4 maleta6 - maleta-pequenia
     maleta1 maleta3 maleta5 - maleta-grande
     hall habitacion101 habitacion102 habitacion103 almacen - localizacion
     robot1 - robot
  )

  ;; Definición del estado inicial
  (:init
    (maleta-grande-en-localizacion maleta1 hall)
    (maleta-pequenia-en-localizacion maleta2 hall)
    (maleta-grande-en-localizacion maleta3 hall)
    (maleta-pequenia-en-localizacion maleta4 hall)
    (maleta-grande-en-localizacion maleta5 habitacion103)
    (maleta-pequenia-en-localizacion maleta6 habitacion103)
    (robot-en-localizacion robot1 hall)

   
  )

  ;; Definición del objetivo
  (:goal (and
           
            (maleta-grande-en-localizacion maleta1 habitacion101)
            (maleta-pequenia-en-localizacion maleta2 habitacion101)
            (maleta-grande-en-localizacion maleta3 habitacion102)
            (maleta-pequenia-en-localizacion maleta4 habitacion102)
            (maleta-grande-en-localizacion maleta5 almacen)
            (maleta-pequenia-en-localizacion maleta6 almacen)
          )
  )
)
