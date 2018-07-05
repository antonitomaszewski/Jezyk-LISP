#lang racket

;; konstruktor i selektory
(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

;; funkcje
; działania
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (mult-interval x y)
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
(define (div-interval x y)
  (mult-interval x (make-interval (/ 1.0 (upper-bound y))
                                  (/ 1.0 (lower-bound y)))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; centrum
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (-  (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ([width (* (abs c) (/ p 100))])
    (make-interval (- c width) (+ c width))))
(define (percent i)
  (let ([center (center i)]
        ;[width (width i)]
        [xk (upper-bound i)])
    (* 100 (- (/ xk (abs center)) 1))))

(define a (make-center-percent 20 5))
a
(percent a)
(width a)
(center a)
    
    
    







    