#lang racket

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0) (lambda (x) x) (compose (repeated f (- n 1)) f)))
((repeated (lambda (x) (* x x)) 2) 5)