#lang racket

(define (expt-rek b n)
  (if (= n 0)
      1
      (* b (expt-rek b (- n 1)))))

(define (expt-iter b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b (- counter 1) (* product b))))
  (expt-iter b n 1))

(define (square x) (* x x))
(define (fast-expt b n)
  (cond [(= n 0) 1]
        [(even? n) (square (fast-expt b (/ n 2)))]
        [else (* b (fast-expt b (- n 1)))]))
;;  (let ((a (expt-rek 2 1000000))) null) wymięka, dla niego to easy (let [(a (fast-expt 2 1000000))] null)