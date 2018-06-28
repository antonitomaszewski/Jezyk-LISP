#lang racket

(define (square x) (* x x))
(define (fast-expt-iter b n)
  (define (helper b n a)
    (cond [(= n 0) a]
          [(even? n) (helper (square b) (/ n 2) a)]
          [else (helper b (- n 1) (* a b))]))
  (helper b n 1))


(define (cube x) (* x x x))
(define (fast-expt-iter_2 b n)
  (define (helper b n a) 
    (if (= n 0)
        a
        (if (even? n)
            (helper (square b) (/ n 2) a)
            (let ([reszta (remainder n 3)])
              (cond [(= reszta 0) (helper (cube b) (/ n 3) a)]
                    [(= reszta 1) (helper (cube b) (/ (- n 1) 3) (* a b))]
                    [(= reszta 2) (helper (cube b) (/ (- n 2) 3) (* a (square b)))])))))
  (helper b n 1))
(define (do times)
  (if (= times 0)
      null
      (cons (cons (fast-expt-iter 2 times)
                  (fast-expt-iter_2 2 times))
            (do (- times 1)))))