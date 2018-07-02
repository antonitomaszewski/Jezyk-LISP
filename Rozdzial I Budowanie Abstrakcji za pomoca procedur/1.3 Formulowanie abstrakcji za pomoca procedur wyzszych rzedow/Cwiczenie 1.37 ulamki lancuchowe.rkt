#lang racket

(define (cont-frac N D h)
  (define (go i)
    (if (= i h)
        (/ (N h) (D h))
        (/ (N i) (+ (D i) (go (+ i 1))))))
  (go 1))
;; to nie okej, te dwa ponizej nie potrzebuja pomocniczej funkcji, pierwsze zle, drugie dobrze, ale dziwaczne
(define (cont-frac-r N D h)
  (if (= h 0) 0
      (/ (N h) (D h) (cont-frac N D (- h 1)))))
(cont-frac-r (lambda (i) 1.0) (lambda (i) 1.0) 100)
(define (cont-frac-r-2 N D h) 
  (if (= h 0) 0 
      (/ (N 1) (+ (D 1) (cont-frac 
                         (λ (i) (N (+ i 1))) 
                         (λ (i) (D (+ i 1))) 
                         (- h 1))))))
#|
nazwijmy funkcje Ni oraz Di początkowe jako N0 i D0, startujemy więc z (c-f N0 D0 h), potem mamy
(c-f N1 = (λ (i) (N0 (+ i 1))) D1 = (λ (i) (D0 (+ i 1))) (- h 1)),
 co daje nam (N1 1) = (λ (i) (N0 (+ i 1))) ((λ (i) (N0 (+ i 1))) 1) -> (N0 2),
załóżmy, że dla pewnej głębokości 1 <= k, daje nam (N k) (k-1 krotne złożenie (λ (i) (N (+ i 1))) ), pokażę, że teza zachodzi także dla k+1,
mamy więc wywołanie dla (c-f (λ (i) (N (+ i 1))) .. (- h k 1)),
z założenia mamy, że (λ (i) ((λ (i) (...(N0 1)...)) (+ i 1))) mamy więc k złożenie funkcji inc, więc da nam to k razy inc, czyli (N (+ k 1)), więc zachodzi
Tutaj za każdym razem obecne k liczy się od 1 więc jest n^2 obliczeń +1, trochę głupio
|#


(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 30)
(/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 30))

(define (cont-frac-i N D h)
  (define (go i result)
    (if (= i 0)
        result
        (go (- i 1) (/ (N i) (+ (D i) result)))))
  (go h 0))
(cont-frac-i (lambda (i) 1.0) (lambda (i) 1.0) 50)