#lang racket

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
(define (good-enough? before-guess guess)
  (< (abs (- before-guess guess)) 0.01))

(define (cuberoot-iter before-guess guess x)
  (if (good-enough? before-guess guess)
      guess
      (cuberoot-iter guess (improve guess x) x)))

(define (cuberoot x)
  (cuberoot-iter 0.0 1.0 x))
(define (cube x) (* x x x))

(cuberoot 8)
(cuberoot 4)
(cube (cuberoot 4))
(cuberoot (cube 4))
(cuberoot -1)
