#lang racket

(define (double f)
  (lambda (x) (f (f x))))
(define (inc x) (+ x 1))
((double inc) 0)

(((double (double double)) inc) 5)
#|
;; (((double (double double)) inc) 5)
;; (double double) == (lambda (x) (double (double x)))
 (double (double double)) == (lambda (x1) ((lambda (x) (double (double x)))
                                           ((lambda (x_) (double (double x_))) x1)))
;; x1 <-- inc
((double (double double)) inc) == ((lambda (x) (double (double x)))
                                   ((lambda (x_) (double (double x_))) inc))
;; x_ <-- x1 <-- inc
((double (double double)) inc) == ((lambda (x) (double (double x)))
                                   (double (double inc)))
;; x <-- (double (double inc))
((double (double double)) inc) == (double (double (double (double inc))))

;; teraz mamy idąc od środka funkcje inc, f0, f1 f2 f3
;; f0 = (inc (inc x)) czyli dodawnie 2 do wartości argumentu --> +2
;; f1 = podwojenie f0 więc poczworzenie funkcji inc --> +4
;; f2 podwojenie f1 poczworzenie f0 poośmienie inc --> +8
;; f3 poszestastnienie inc --> +16
;; wynik więc powinien być 21 i tak, rzeczywiście jest

|#

