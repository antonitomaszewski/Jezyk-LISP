#lang racket

;; Pomocnicze Funkcje
(define (average x y) (/ (+ x y) 2))

;; Punkt
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;; Odcinek
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

;; Środek odcinka
(define (midpoint-segment s)
  (let ([mid-x (average (x-point (start-segment s))
                        (x-point (end-segment s)))]
        [mid-y (average (y-point (start-segment s))
                        (y-point (end-segment s)))])
    (make-point mid-x mid-y)))

;; Print
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

;; Testy
(print-point (midpoint-segment (make-segment (make-point 0 1) (make-point -2 -1))))
(print-point (midpoint-segment (make-segment (make-point 0 0) (make-point 2 2))))