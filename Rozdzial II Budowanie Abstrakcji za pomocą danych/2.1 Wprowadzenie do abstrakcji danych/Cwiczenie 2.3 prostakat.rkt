#lang racket

;; Pomocnicze funkcje
; Punkt
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))


; Pierwsza Implementacja
(define (make-rectangle bottom-left top-right)  ;; lewy dół, prawa góra
  (cons bottom-left top-right))

; selektory
(define (bottom-left r)
  (car r))
(define (bottom-right r)
  (make-point (x-point (top-right r))
              (y-point (bottom-left r))))
(define (top-left r)
  (make-point (x-point (bottom-left r))
              (y-point (top-right r))))
(define (top-right r)
  (cdr r))

(define (width r)
  (abs (- (x-point (bottom-left r))
          (x-point (bottom-right r)))))
(define (high r)
  (abs (- (y-point (bottom-left r))
          (y-point (top-left r)))))

(define (perimeter r)
  (* (+ (width r) (high r)) 2))
(define (area r)
  (* (width r) (high r)))

(define r (make-rectangle (make-point 0 0) (make-point 3 2))) ;; (0,0) (0,3) (0,2) (3,2)
(perimeter r)
(area r)

; Druga Implementacja
(define (make-rect-2 point vect-horizontal vect-vertical)
  (cons point (cons vect-horizontal vect-vertical)))
; selektory
(define (rect-point r)
  (car r))
(define (rect-horizontal-vector r)
  (cadr r))
(define (rect-vertical-vector r)
  (cddr r))
(define (width-2 r)
  (abs (rect-horizontal-vector r)))
(define (high-2 r)
  (abs (rect-vertical-vector r)))

(define (perimeter-2 r)
  (* (+ (high-2 r) (width-2 r)) 2))
(define (area-2 r)
  (* (high-2 r) (width-2 r)))

(define r-2 (make-rect-2 (make-point 0 0) -1 2)) ;; (0,0) (0,3) (0,2) (3,2)
(perimeter-2 r-2)
(area-2 r-2)

  





   