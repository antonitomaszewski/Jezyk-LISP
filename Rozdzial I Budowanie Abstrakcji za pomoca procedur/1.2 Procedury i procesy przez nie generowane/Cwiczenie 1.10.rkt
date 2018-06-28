#lang racket

(define (A x y)
  (cond [(= y 0) 0]
        [(= x 0) (* y 2)]
        [(= y 1) 2]
        [else (A (- x 1)
                 (A x (- y 1)))]))

(A 1 10)
(A 2 4)
(A 3 3)

(define (f n) (A 0 n))  ;; 2n
(define (g n) (A 1 n))  ;; (A 0 (A 0 (A 0 (... (A 0 1)...) == (A 0 (A 0 (... (A 0 2)...) == 2**n, będzie n razy powtarzane cond x = 0, więc y= y * 2, szybkie potęgowanie dwójkowe, dla y = 0 ->0, dla y = 1 -> 2, koniec 
(define (h n) (A 2 n))  ;; (A 2 n) = (A 1 (A 2 (- n 1)) = 2**(A 2 (- n 1)) = 2**(2**(2**(...**2))...) n-1 razy
(define (k n) (* 5 n n)) ;; 5*n*n