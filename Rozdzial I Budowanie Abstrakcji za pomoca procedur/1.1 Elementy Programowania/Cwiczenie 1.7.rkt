#lang racket

(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? before-guess guess)
  (< (abs (- before-guess guess)) 0.01))

(define (sqrt-iter before-guess guess x)
  (if (good-enough? before-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(sqrt 1000000000000000000)
(sqrt 4)
(sqrt 0)