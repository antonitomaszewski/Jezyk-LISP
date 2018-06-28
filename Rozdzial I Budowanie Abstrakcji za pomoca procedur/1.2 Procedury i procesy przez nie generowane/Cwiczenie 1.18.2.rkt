#lang racket

;; to jest trochęszustwo, po prostu gdy wie ze jest nieparzysta, to tez robi jakby szybkie dodawanie, dzielac na pol, ale zrobilby to i tak w nastepnym kroku
(define (double a) (+ a a)) 
(define (halve a) (/ a 2)) 
  
(define (* a b) 
  (define (mult-iter result a b ile)
    (cond ((= b 0) (cons result ile)) 
          ((even? b) (mult-iter result (double a) (halve b) (+ ile 1))) 
          (else (mult-iter (+ result a) (double a) (- (halve b) 0.5) (+ ile 1))))) 
  (mult-iter 0 a b 0))
