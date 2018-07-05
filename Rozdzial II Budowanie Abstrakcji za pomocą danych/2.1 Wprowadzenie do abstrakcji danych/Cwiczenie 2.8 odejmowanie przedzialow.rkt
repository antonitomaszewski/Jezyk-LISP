#lang racket

;; Pomocznicze funkcje
;; konstruktor i selektory
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

;; Cwiczenie
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
;; Testy
(define a (make-interval 0 1))
(define b (make-interval 2 3))
(sub-interval a b)