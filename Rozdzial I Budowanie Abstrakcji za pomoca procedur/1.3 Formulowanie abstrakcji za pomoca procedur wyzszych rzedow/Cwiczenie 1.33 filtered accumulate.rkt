#lang racket

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (let ([val (term a)])
        (if (filter a)
            (combiner (filtered-accumulate filter combiner null-value term (next a) next b) val)
            (filtered-accumulate filter combiner null-value term (next a) next b)))))

(filtered-accumulate even?
                     +
                     0
                     (lambda (x) x)
                     0
                     (lambda (x) (+ x 1))
                     10)

(define (prime? n)
  (define (divides? a) (= (modulo n a) 0))
  (define (next a) (+ a 2))
  (define (square a) (* a a))
  (define (iter a)
    (if (> (square a) n)
        true
        (if (divides? a)
            false
            (iter (next a)))))
  (if (= n 2)
      true
      (if (or (= n 0) (= n 1) (even? n))
          false
          (iter 3))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate prime? + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b))

(sum-of-squares-of-primes 0 7)
(+ 4 9 25 49)

(define (nwd a b)
  (if (= b 0)
      a
      (nwd b (modulo a b)))) 
(define (prime-factorial n)
  (define (co-prime? a)
    (= (nwd n a) 1))
  (filtered-accumulate co-prime? * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(prime-factorial 5)
(* 2 3 4)