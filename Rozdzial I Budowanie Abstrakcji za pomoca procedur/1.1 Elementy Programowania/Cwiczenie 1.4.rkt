#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; zwraca operator identyczny ze znakiem b -- dzięki czemu niweluje znak b, analogicznie można zapisać (abs x)
(define (abs x)
  ((if (> x 0) + -) x))
(abs -1)
(abs 1)