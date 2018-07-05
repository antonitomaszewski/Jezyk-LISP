#lang racket

;; Pomocnicze funkcje
(define (square x) (* x x))
(define (inc x) (+ x 1))

;; Cwiczenie

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

#|
one - (add-1 zero), czyli
((lambda (n) (lambda (f0) (lambda (x0) (f0 ((n f0) x0))))) (lambda (f1) (lambda (x1) x1)))
na początek za n wstawiamy (lambda (f1) (lambda (x1) x1))
, mamy więc:
((lambda (f0)
   (lambda (x0)
     (f0 (((lambda (f1) (lambda (x1) x1))
           f0) ;; <--
          x0)))))
robimy podstawienie [f1/f0], co daje nam
((lambda (f0)
   (lambda (x0)
     (f0 ((lambda (x1) x1)
          x0)))))
((lambda (f0)
   (lambda (x0)
     (f0 x0))))
czyli wracając do normalnej postaci
one (lambda (f) (lambda (x) (f x)))
|#


(define (add a b) 
  (lambda (f) 
    (lambda (x) 
      ((a f) ((b f) x)))))

;;(define two (add one one))
((two inc) 0)
(define four (add two two))
((four inc) 0)
(((add two four) inc) 0)
((two inc) ((four inc) 0))




