#lang racket

(define (cont-frac N D h)
  (define (go i result)
    (if (= i 0)
        result
        (go (- i 1) (/ (N i) (+ (D i) result)))))
  (go h 0))

(define (square x) (* x x))
(define (tan-cf x h)
  (define minus-square-of-x (- (square x)))
  (cont-frac (λ (i) (if (= i 1) x minus-square-of-x)) (λ (i) (- (* i 2) 1.0)) h))

(tan-cf (/ pi 4) 1000)