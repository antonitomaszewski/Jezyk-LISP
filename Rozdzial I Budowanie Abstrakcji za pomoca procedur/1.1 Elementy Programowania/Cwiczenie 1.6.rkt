#lang racket

(define (new-if predykat nastepnik alternatywa)
  ;; skoro implementacja jest gorliwa (stosowana) to wywolany new-if najpierw obliczy wartosci wszystkich parametrow,
  ;; parametrow, a dopiero później  "wstawi" obliczone wartości  do ciała funkcji,
  ;; zwyczajny if, gdy znajdzie prawdę nie liczy wartości dla fałszu,
  ;; ani gdy predykat jest fałszywy nie liczy waartości dla prawdy, a jedynie dla fałszu
  (cond (predykat nastepnik)
        (else alternatywa)))