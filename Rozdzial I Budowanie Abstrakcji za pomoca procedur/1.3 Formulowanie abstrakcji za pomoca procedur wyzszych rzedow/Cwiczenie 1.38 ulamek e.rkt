#lang racket

(define (cont-frac N D h)
  (define (go i result)
    (if (= i 0)
        result
        (go (- i 1) (/ (N i) (+ (D i) result)))))
  (go h 0))

(define (e-2 h)
  (cont-frac (lambda (i) 1.0) (lambda (i)
                                (let* ([reszta (remainder i 3)]
                                       [calkowite-dzielenie-przez-3 (/ (- i reszta) 3)])
                                  (if (= reszta 2)
                                      (* 2 calkowite-dzielenie-przez-3)
                                      1))) h))

(define (do i)
  (define f (lambda (i)
    (let* ([reszta (remainder i 3)]
           [calkowite-dzielenie-przez-3 (/ (- i reszta) 3)])
      (if (= reszta 2)
          (* 2 calkowite-dzielenie-przez-3)
          1))))
  (if (= i 0)
      null
      (begin ;(display i)
             ;(newline)
             (display (Di i))
             (newline)
             (do (- i 1)))))

(define Di
(lambda (i) (if (= (modulo i 3) 2)
                (* (/ (+ i 1) 3) 2)
                1)))
;; (cont-frac Di (lambda (i) 1.0) 100)
(cont-frac (lambda (i) 1.0) Di 100)




;; Z wikipedii e = (+ 2 (/ 1 (+ 1 ,(/ 1 (+ 2 (/ 2 (+ 3...

(define e (lambda (h) (+ 2.0 (cont-frac (lambda (i) (if (= i 1) 1.0 (- i 1.0))) (lambda (i) i) h))))
(e 1000) ;; 2.99 to też nie jest dobry wynik

(define f (lambda (i) (if (= i 1) i (- i 1.0))))
(define (iterf i)
  (cond [(= i 0) null]
        [else (display (f i)) (newline) (iterf (- i 1))]))
(define g (lambda (i) i))
(define (iterg i)
  (cond [(= i 0) null]
        [else (display (g i)) (newline) (iterg (- i 1.0))]))