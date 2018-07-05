#lang racket

;; Pomocnicze procedury

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; Cwiczenie

(define (make-rat n d)
  (let ([g (gcd n d)])
    (let ([new-n (/ n g)]
          [new-d (/ d g)])
      (cond [(and (>= new-n 0) (> new-d 0)) (cons new-n new-d)]
            [(and (< new-n 0) (< new-d 0)) (cons (abs new-n) (abs new-d))] ;; dwa pierwsze warunki == n*d > 0
            [(not (= new-d 0)) (cons (- (abs new-n)) (abs new-d))]))))  ;; ostatni warunek == n*d < 0, bez (mk-rt 0 a) a!=0

#|
Wporządku rozwiązanie, new-d zawsze dodatnie, bo dzielimy przez (sign d), również new-n będzie miało odpowiedni znak -> 1) n>0 jeśli d<0 to -n ok, dla d>0 też ok +n, analogicznie dla n<0
(define (make-rat n d)
  (let ((g ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n g) (/ d g))))
|#

;; Testowanie

(make-rat 1 2)
(make-rat -1 2)
(make-rat 1 -2)
(make-rat -1 -2)
;; (make-rat 0 0)
;; (make-rat 1 0)



