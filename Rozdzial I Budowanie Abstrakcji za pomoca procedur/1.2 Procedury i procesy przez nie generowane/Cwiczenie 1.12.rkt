#lang racket

(define (pascal kolumna wiersz)
  (if (= kolumna 1)
      1
      (if (= wiersz 1)
          1
          (if (= kolumna wiersz)
              1
              (+ (pascal (- kolumna 1) (- wiersz 1))
                 (pascal kolumna (- wiersz 1)))))))
#|
(define (do times)
  (define (helper times kol wiersz)
    (if (< times 0)
        null
        (if (= kol 1)
            (cons (pascal kol wiersz) (helper (- times 1) kol (- wiersz 1)))
            (if (= wiersz 1)
                (cons (pascal kol wiersz) (helper (- times 1) (- kol 1) wiersz))
                (cons (pascal kol wiersz)
                      (cons (helper (- times 1) (- kol 1) wiersz)
                            (helper (- times 1) kol (- wiersz 1))))))))
  (helper times 10 10))
|#

(pascal 1 1) 
(pascal 2 2) 
(pascal 3 2) 
(pascal 4 2) 
(pascal 5 2) 
(pascal 5 3) 