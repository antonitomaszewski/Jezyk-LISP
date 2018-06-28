#lang racket
(define (f n)
  (if (< n 3)
      n
      (+ (* (f (- n 1)) 1)
         (* (f (- n 2)) 2)
         (* (f (- n 3)) 3))))

(define (f-iter n)
  (define (helper fa-1 fa-2 fa-3 counter)
    (if (= counter n)
        (+ fa-1 (* fa-2 2) (* fa-3 3))
        (helper (+ fa-1 (* fa-2 2) (* fa-3 3)) fa-1 fa-2 (+ counter 1))))
  (if (< n 3)
      n
      (helper 2 1 0 3)))

(define (do times)
  (if (= times -1)
      null
      (cons (cons (f times)
                  (f-iter times))
            (do (- times 1)))))