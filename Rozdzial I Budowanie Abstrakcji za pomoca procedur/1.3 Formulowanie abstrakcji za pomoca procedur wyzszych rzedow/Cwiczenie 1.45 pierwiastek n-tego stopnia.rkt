#lang racket

;; Potrzebne funkcje
(define (average x y) 
  (/ (+ x y) 2.0)) 
  
(define (average-damp f) 
  (lambda (x) (average x (f x)))) 
  
  
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) tolerance)) 
  (define (try guess) 
    (let ((next (f guess))) 
      (if (close-enough? guess next) 
          next 
          (try next)))) 
  (try first-guess)) 
  
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0) (lambda (x) x) (compose (repeated f (- n 1)) f)))

;; Cwiczenie
(define (log2 x) (floor (+ (/ (log x) (log 2)) 1)))
(define (pow x n)
  (if (= n 0)
      1
      (if (= (remainder n 2) 0)
          ((lambda (x) (* x x)) (pow x (/ n 2)))
          (* x (pow x (- n 1))))))

(define (nth-root x n) 
  (fixed-point ((repeated average-damp (log2 n)) (lambda (y) (/ x (pow y (- n 1))))) 1.0))

;; Proby
(nth-root 8 3)
(nth-root (pow 10 10) 10)



