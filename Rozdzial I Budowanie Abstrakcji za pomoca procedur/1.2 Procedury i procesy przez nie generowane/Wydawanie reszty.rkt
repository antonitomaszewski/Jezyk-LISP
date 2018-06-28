#lang racket

(define (first-denomination kinds-of-coins)
  (cond [(= kinds-of-coins 1) 1]
        [(= kinds-of-coins 2) 5]
        [(= kinds-of-coins 3) 10]
        [(= kinds-of-coins 4) 25]
        [(= kinds-of-coins 5) 50]))

(define (count-change amount)
  (cc-iter amount 1 0 5))

(define (cc-iter amount kinds-of-coins uzbierane limit)
  (cond [(> uzbierane amount) 0]
        [(= uzbierane amount) 1]
        [(> kinds-of-coins limit) 0]
        [else (+ (cc-iter amount kinds-of-coins (+ uzbierane (first-denomination kinds-of-coins)) limit)
                 (cc-iter amount (+ kinds-of-coins 1) uzbierane limit))]))

(count-change 100)

(define (count-change-rek amount)
  (cc-rek amount 5))
(define (cc-rek amount kinds-of-coins)
  (cond [(= amount 0) 1]
        [(or (< amount 0) (= kinds-of-coins 0)) 0]
        [else (+ (cc-rek (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
                 (cc-rek amount (- kinds-of-coins 1)))]))