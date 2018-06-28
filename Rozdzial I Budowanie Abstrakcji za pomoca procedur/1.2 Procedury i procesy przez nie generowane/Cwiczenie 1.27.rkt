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
  (lambda (a) (try-it a)))


(define (carmichael-test--cheaters? n)
  (define (iter i)
    (if (= i 1)
        (begin (display n) (display " Przeszło test\n"))
        (if ((fermat-test n) i)
            (iter (- i 1))
            (begin (display n) (display " Nie przeszło testu\n")))))
  (iter (- n 1)))

(define (f n) (carmichael-test--cheaters? n))

(f 561)
(f 1105)
(f 1729)
(f 2465)
(f 2821)
(f 6601)