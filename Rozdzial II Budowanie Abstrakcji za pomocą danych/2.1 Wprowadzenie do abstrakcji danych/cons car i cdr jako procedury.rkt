#lang racket

(define (cons x y)
  (define (dispatch m)
    (cond [(= m 0) x]
          [(= m 1) y]
          [else (error "Argument różny od 0 i 1 - CONS" m)]))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

(define a (cons 1 2))
(car a)
(cdr a)
