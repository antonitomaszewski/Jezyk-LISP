#lang racket

;; cons jest procedurą dwuargumentową (x i y), która zwraca pewną procedurę, która czeka na domknięcie na m którą da się zastosować od x i y
;; car jest procedurą, która zwraca pierwszy z jej dwóch argumentów
;; cdr zwraca drugi z dwóch argumentów

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 1 2))
(car a)
(cdr a)

#|
a = (cons 1 2), czyli a = (lambda (m) (m 1 2))
(car a) = (a (lambda (p q) p) = ((lambda (m) (m 1 2) (lambda (p q) p))
tutaj m = (lambda (p q) p), czyli procedura dwuargumentowa, która zwraca pierwszy z nich, w tym wypadku 1,
cdr jest zdefiniowany analogicznie, można zamiast [1/x] i zamias [2/y]

(car (cons x y))
((cons x y) (lambda (p q) p))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) (x y))
x
|#
(define (f x y)
  (lambda (znak) (znak x y)))
(define q (f 3 5))
(q +)