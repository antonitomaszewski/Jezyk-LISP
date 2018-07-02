#lang racket

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) (if (= x 0) 1 x)) 0 (lambda (x) (+ x 1)) n))
(factorial 5)

(define (product-r term a next b)
  (if (> a b)
      1
      (* (term a) (product-r term (next a) next b))))
(define (factorial-r n)
  (product-r (lambda (x) (if (= x 0) 1 x)) 0 (lambda (x) (+ x 1)) n))
(factorial-r 5)

(define (square n) (* n n))
(define (pi-product n)
  (* (product (lambda (n) (/ (* (* n 2) (+ (* n 2) 2))
                             (square (+ (* 2 n) 1))))
                1.0 (lambda (n) (+ n 1)) n) 4))

(pi-product 12314)