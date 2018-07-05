#lang racket

;; konstruktor i selektory
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

;; funkcje
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (div-interval x y)
  (mult-interval x (make-interval (/ 1.0 (upper-bound y))
                                  (/ 1.0 (lower-bound y)))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
(define (mult-interval x y)
  (let ([p1 (* (lower-bound x) (lower-bound y))]
        [p2 (* (lower-bound x) (upper-bound y))]
        [p3 (* (upper-bound x) (lower-bound y))]
        [p4 (* (upper-bound x) (upper-bound y))])
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (mult x y)
  (let ([xp (lower-bound x)]
        [xk (upper-bound x)]
        [yp (lower-bound y)]
        [yk (upper-bound y)])
    (cond [(>= xp 0) (cond [(>= yp 0) (make-interval (* xp yp) (* xk yk))]
                           [(<= yk 0) (make-interval (* xk yp) (* xp yk))]
                           [else (make-interval (* xk yp) (* xk yk))])]
          [(<= xk 0) (cond [(>= yp 0) (make-interval (* xp yk) (* xk yp))]
                           [(<= yk 0) (make-interval (* xk yk) (* xp yp))]
                           [else (make-interval (* xp yk) (* xp yp))])]
          [else (cond [(>= yp 0) (make-interval (* xp yk) (* xk yk))]
                      [(<= yk 0) (make-interval (* xk yp) (* xp yp))]
                      [else (make-interval (min (* xp yk) (* xk yp))
                                           (max (* xp yp) (* xk yk)))])])))
(define a (make-interval 100 101))
(define b (make-interval 1000 1001))
(mult-interval a b)
(mult a b)