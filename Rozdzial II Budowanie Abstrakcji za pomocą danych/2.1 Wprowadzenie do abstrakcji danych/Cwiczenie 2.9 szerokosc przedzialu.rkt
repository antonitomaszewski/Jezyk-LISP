#lang racket

;; konstruktor i selektory
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

;; funkcje
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mult-interval x y)
  (let ([p1 (* (lower-bound x) (lower-bound y))]
        [p2 (* (lower-bound x) (upper-bound y))]
        [p3 (* (upper-bound x) (lower-bound y))]
        [p4 (* (upper-bound x) (upper-bound y))])
       (make-interval (min p1 p2 p3 p4)
                      (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mult-interval x (make-interval (/ 1.0 (upper-bound y))
                                  (/ 1.0 (lower-bound y)))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (width-of-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

#|
(add x y) - (add (cons xp xk) (yp yk))
(width (add x y)) == (/ (- (+ xk yk) (+ xp yp)) 2) == (/ (+ (- xk xp) (yk yp)) 2) == (+ (/ (- xk xp) 2) (/ (- yk yp) 2))
==> (+ (width x) (width y)),
czyli (width (add x y)) = (+ (width x) (width y))

(sub x y) = (sub (cons xp xk) (cons yp yk))
(width (sub x y)) == (/ (- (- xk yp) (- xp yk)) 2) == (/ (+ xk (- yp) (- xp) yk) 2) == (/ (+ (- xk xp) (- yk yp)) 2)
== (+ (/ (- xk xp) 2) (/ (- yk yp) 2))
==> (+ (width x) (width y))


mult
(w 0 2) = 1, (w 0 4) = 2
(w 0 8) = 4

(w 1 3) = 1, (w 1 5) = 2
(w 1 15) = 7
skoro dla takich samych szerokości wejściowych szerokość wyjściowa może przyjąc dwie różne wartości,
to (width (mult x y)) nie da się określić jako jakiejś funkcji f, takiej że (f (width x) (width y)) = (width (mult x y)),
div:
(w 0 2) = 1, (w 1 1) = 0
(w (div (0 2) (1 1))) = (w (0 2)) = 1
(w 2 4) = 1, (w 2 2) = 0
(w (div (2 4) (2 2))) = (w (mult (2 4) ((/ 1 2) (/ 1 2)))) = (w (1 2)) = 0.5
argument analogiczny do mult



|#