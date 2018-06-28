#lang racket

(define (inc a) (+ a 1))
(define (dec a) (- a 1))

(define (+_rek a b)
  (if (= a 0)
      b
      (inc (+_rek (dec a) b))))

(define (+_iter a b)
  (if (= a 0)
      b
      (+_iter (dec a) (inc b))))
#|
(+_rek 2 2)
(inc (+_rek 1 2))
(inc (inc (+_rek 0 2)))
(inc (inc 2))
(inc 3)
4



(+_iter 2 2)
(+_iter 1 3)
(+_iter 0 4)
4
|#