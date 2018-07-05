#lang racket
(define (square x) (* x x))
(define (pot a n)
  (if (= n 0)
      1
      (if (even? n)
          (square (pot a (/ n 2)))
          (* a (square (pot a (/ (- n 1) 2)))))))

(define (cons a b)
  (* (pot 2 a) (pot 3 b)))
(define (car z)
  (if (= (modulo z 2) 0)
      (+ 1 (car (/ z 2)))
      0))
(define (cdr z)
  (if (= (modulo z 3) 0)
      (+ 1 (cdr (/ z 3)))
      0))

(define a (cons 17 8))
a
(car a)
(cdr a)