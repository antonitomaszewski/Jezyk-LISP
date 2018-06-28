#lang racket

(define (*_ a b)
  (if (= b 0)
      0
      (+ a (*_ a (- b 1)))))

(define (double a) (* a 2))
(define (halve a) (/ a 2))
(define (fast-mult a b)
  (if (= b 0)
      0
      (if (even? b)
          (fast-mult (double a) (halve b))
          (+ a (fast-mult a (- b 1)))))) 
          