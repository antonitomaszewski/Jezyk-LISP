#lang racket

(define (next n) (if (= n 2) 3 (+ n 2)))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor 2 n))

(define (find-divisor test-divisor n)
  (cond [(> (square test-divisor) n) n]
        [(divides? test-divisor n) test-divisor]
        [else (find-divisor (next test-divisor) n)]))

(define (divides? a b)
  (= (remainder b a) 0))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)