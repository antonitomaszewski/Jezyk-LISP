#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (accumulate combiner null-value term (next a) next b) (term a))))
(accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)

(define (accumulate-i combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
(accumulate-i * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5)

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))