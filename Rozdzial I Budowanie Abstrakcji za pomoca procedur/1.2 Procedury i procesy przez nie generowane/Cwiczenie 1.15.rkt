#lang racket

(define =< <=)

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (<= (abs angle) 0.1)
      angle
      (p (sine (/ angle 3.0)))))

(define (sine-counter angle)
    (if (<= (abs angle) 0.1)
      (cons angle 0)
      (let ([next (sine-counter (/ angle 3.0))])
        (cons (p (car next))
              (+ (cdr next) 1)))))
(sine-counter 12.15)


; (p (p (...(p (/ a (pot 3 n)))...)  n razy powtorzenie p, gdzie (pot podstawa potega) zwraca wynik podstawa^potega

;; (/ a (pot 3 n)) <= 0.1 --> (<= a (* 0.1 (pot 3 n))) --> (<= (* a 10) (pot 3 n)) --> (log 3 (* a 10)) <= n, czyli najmniejsze takie n, większe od logarytmu o podstawie 3 z 10*a
(floor (+ (/ (log 121.5) (log 3)) 1))