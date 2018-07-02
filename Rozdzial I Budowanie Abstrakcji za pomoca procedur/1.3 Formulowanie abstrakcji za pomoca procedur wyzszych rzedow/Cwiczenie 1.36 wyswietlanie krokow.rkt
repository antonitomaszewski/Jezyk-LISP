#lang racket

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ([next (f guess)])
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (x-to-the-x y)
  (fixed-point (lambda (x) (/ (log y) (log x))) 2.0))
(x-to-the-x 1000)
(define (average x y) (/ (+ x y) 2))
(define (x-to-the-x-av y)
  (fixed-point (lambda (x) (average x (/ (log y) (log x)))) 2.0))
(x-to-the-x-av 1000);; znacznie krócej zajmuje