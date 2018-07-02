#lang racket

(define (iterative-improve good-enough? improve)
  (λ (x) (let ([new-x (improve x)])
           (if (good-enough? new-x)
               new-x
               ((iterative-improve good-enough? improve) new-x)))))
#|
((iterative-improve (lambda (x y) (< (abs (- x y)) 0.1))
                    (lambda (x) (/ x 2))) 10.0)
|#
(define tolerance 0.00001)
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

#|

Ciekawe -- iter-imp jest jakby lambdą i czeka na guess -- wcześniej tego nie zauważałem, ale jest to zupełnie logiczne
(define (iterative-improve good-enough? improve)
  (define (iter-imp guess)
    (if (good-enough? guess)
        guess
        (iter-imp (improve guess))))
  iter-imp)
|#
        
(define (sqrt x)
  ((iterative-improve 
    (lambda (guess) (< (abs (- (square guess) x)) tolerance))
    (lambda (guess) (average guess (/ x guess))))
    1.0))

(sqrt 9)

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess) (< (abs (- guess (f guess))) tolerance))
    (lambda (guess) (f guess)))
   first-guess))

(fixed-point cos 1)