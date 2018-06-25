#lang racket

10  ;; 10
(+ 5 3 4)  ;; 12
(- 9 1)  ;; 8
(/ 6 2)  ;; 3
(+ (* 2 4) (- 4 6)) ;; 6
(define a 3)  ;; nic
(define b (+ a 1))  ;; nic
;; (define c (/ 1 0)) ;; od razu chce obliczyć -> więc gdy (define b (+ a 1)) to już tu jest obliczana wartosc b i związana w środowisku z 4 później już tylko wystarczy po nią sięgnąć
(+ a b (* a b))  ;; 19
(= a b)  ;; #f
(if (and (> b a) (< b (* a b)))
    b
    a)  ;; 4
(cond [(= a 4) 6]
      [(= b 4) (+ 6 7 a)]  ;; <- #t
      [else 25])  ;; 16
(+ 2 (if (> b a) b a))  ;; 6
(* (cond [(> a b) a]
         [(< a b) b]  ;; <- #t
         [else -1])
   (+ a 1))  ;; 16
