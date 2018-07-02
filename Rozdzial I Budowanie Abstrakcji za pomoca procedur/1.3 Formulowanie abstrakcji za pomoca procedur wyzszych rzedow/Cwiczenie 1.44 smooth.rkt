#lang racket

;; Potrzebne funkcje
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0) (lambda (x) x) (compose (repeated f (- n 1)) f)))

;; Cwiczenie
(define (smooth f)
  (define (average a b c) (/ (+ a b c) 3))
  (define dx 0.000001)
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))
(define (n-fold-smooth f n)
  (repeated (smooth f) n))

;; Proby
((smooth (lambda (x) (+ (sin x) (cos x) x))) 0)
((repeated (smooth (λ (x) (+ (sin x) (cos x)))) 100) 0)