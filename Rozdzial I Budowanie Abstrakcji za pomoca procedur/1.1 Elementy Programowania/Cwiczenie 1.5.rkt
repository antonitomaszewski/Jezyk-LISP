#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p)) ;; za wszelką cenę chce obliczyć wartość (p) mimo, że nie będzie go używać w procedurze wogóle
;; UWAGA ZAPĘTLI SIĘ W NIESKOŃCZONOŚĆ -> używa stosowanej (gorliwej) kolejności obliczania