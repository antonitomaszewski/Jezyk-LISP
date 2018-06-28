#lang racket

(define (double a) (/ a (/ 1 2)))
(define (halve a) (/ a 2))
(define (* a b)
  (define (helper a b result)
    (if (= b 0)
        (cons result 0)
        (if (even? b)
            (let [(next (helper (double a) (halve b) result))]
              (cons (car next) (+ (cdr next) 1)))
            (let [(next (helper a (- b 1) (+ result a)))]
              (cons (car next) (+ (cdr next) 1))))))
  (helper a b 0))

(define (do times)
  (lambda (a)
    (if (= times 0)
        null
        (cons (* a times)
              ((do (- times 1)) a)))))
((do 10) 7)