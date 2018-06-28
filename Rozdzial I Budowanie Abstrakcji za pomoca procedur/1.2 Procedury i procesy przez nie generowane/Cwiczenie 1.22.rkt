#lang racket
;;#lang sicp

;; w rakecie nie ma runtime

;;(require scheme/runtime-config)
;;(require racket/runtime-config)



(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor 2 n))

(define (find-divisor test-divisor n)
  (cond [(> (square test-divisor) n) n]
        [(divides? test-divisor n) test-divisor]
        [else (find-divisor (+ test-divisor 1) n)]))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n))



(define (runtime) (current-milliseconds))
(define (timed-prime-test n)
  ;;(newline)
  ;;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

(do 12)