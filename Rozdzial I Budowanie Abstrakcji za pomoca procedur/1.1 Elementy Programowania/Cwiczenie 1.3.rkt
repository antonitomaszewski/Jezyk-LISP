#lang racket

(define (square x) (* x x))
(define square-lambda (lambda (x) (* x x)))

(define (sum-of-squares x y) (+ (square x) (square y)))
(define sum-of-squares-lambda (lambda (x y) (+ (square-lambda x) (square-lambda y))))

(define (sum-of-two-greatest x y z)
  (if (> x y)
      (if (> y z)
          (sum-of-squares x y)
          (sum-of-squares x z))
      (if (> x z)
          (sum-of-squares y x)
          (sum-of-squares y z))))
(define sum-of-two-greatest-lambda
  (lambda (x y z)
    (if (> x y)
        (if (> y z)
            (sum-of-squares x y)
            (sum-of-squares x z))
        (if (> x z)
            (sum-of-squares y x)
            (sum-of-squares y z)))))
(define (sum-of-two-greatest-cond x y z)
  (cond [(and (>= x z) (>= y z)) (sum-of-squares x y)]
        [(and (>= x y) (>= z y)) (sum-of-squares x z)]
        [(and (>= y x) (>= z x)) (sum-of-squares y z)]))


(square 2)
(square -2)
(square-lambda 3)
(square-lambda -3)
(display "\n")
(sum-of-squares 2 3)
(sum-of-squares 2 -3)
(sum-of-squares-lambda 2 3)
(sum-of-squares-lambda 2 -3)
(display "\n")
(sum-of-two-greatest 1 -2 3)
(sum-of-two-greatest-lambda 1 -2 3)
(sum-of-two-greatest-cond -1 -2 -3)
(display "\n")
(sum-of-two-greatest 1 1 1)
(sum-of-two-greatest-lambda 1 1 1)
(sum-of-two-greatest-cond 1 1 1)