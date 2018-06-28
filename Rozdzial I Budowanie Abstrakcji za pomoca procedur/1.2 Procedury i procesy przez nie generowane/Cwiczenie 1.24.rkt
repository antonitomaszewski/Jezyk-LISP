#lang racket

(define (square x) (* x x))
(define (expmod base exp m)
  (cond [(= exp 0) 1]
        [(even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m)]
        [else
         (remainder (* base (expmod base (- exp 1) m)) m)]))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond [(= times 0) true]
        [(fermat-test n) (fast-prime? n (- times 1))]
        [else false]))

(define (probably-prime? n)
  (lambda (ile) (fast-prime? n ile)))
(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  ;;(newline)
  ;;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if ((probably-prime? n) 1000)
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (display "\n"))


(define (search-for-primes from how-many)
  (define (iter from how-many)
    (if (= how-many 0)
        (values)
        (if (timed-prime-test from)
            (iter (+ from 2) (- how-many 1))
            (iter (+ from 2) how-many))))
  (let ([reszta (remainder from 2)])
    (if (= reszta 0)
        (iter (+ from 1) how-many)
        (iter from how-many))))

(define (pot10 b) (expt 10 b))


(define (do times)
  (if (= times 0)
      (values)
      (begin (search-for-primes (pot10 times) 3)
             (newline)
             (do (- times 1)))))

(do 9)
