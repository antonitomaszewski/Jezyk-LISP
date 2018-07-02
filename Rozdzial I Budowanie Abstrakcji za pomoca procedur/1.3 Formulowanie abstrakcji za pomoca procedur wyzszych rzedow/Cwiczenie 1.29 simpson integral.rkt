#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc a) (+ a 1))
(define (identity a) a)
(define (cube a) (* a a a))

(define (closest-even n);; w treści jest o nieparzystej, ale wtedy wyniki są gorsze
  (+ n (remainder n 2)))

(define (simpson-integral f a b n)
  (define new-n (closest-even n))
  (define h (/ (- b a) new-n))
  (define (simpson-term k)
    (define yk (f (+ a (* k h))))
    (define a*yk (cond [(or (= k 0) (= k new-n)) yk]
                       [(even? k) (* 2 yk)]
                       [else (* 4 yk)]))
    a*yk)
  (* (/ h 3.0) (sum simpson-term a inc new-n)))

(simpson-integral (lambda (x) x) 0 1 11)
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)