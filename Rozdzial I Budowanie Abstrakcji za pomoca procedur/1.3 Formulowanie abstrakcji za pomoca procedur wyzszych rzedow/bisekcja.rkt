#lang racket


(define (search f neg-point pos-point)
  (define (close-enough? a b) (< (abs (- a b)) 0.001))
  (define (average a b) (/ (+ a b) 2))
  (let ([midpoint (average neg-point pos-point)])
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ([test-value (f midpoint)])
          (cond [(positive? test-value) (search f neg-point midpoint)]
                [(negative? test-value) (search f midpoint pos-point)]
                [else midpoint])))))
(search (lambda (x) x) -1 1)

(define (half-interval-method f a b)
  (let ([a-value (f a)]
        [b-value (f b)])
    (cond [(and (negative? a-value) (positive? b-value)) (search f a b)]
          [(and (positive? a-value) (negative? b-value)) (search f b a)]
          [else
           (error "Wartości funkcji nie mają przeciwnych znaków: " a b)])))
;(half-interval-method (lambda (x) x) 1 2)
(half-interval-method sin 2.0 4.0)