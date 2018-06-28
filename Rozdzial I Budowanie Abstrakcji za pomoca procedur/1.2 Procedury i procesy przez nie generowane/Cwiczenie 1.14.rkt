#lang racket

(cc-rek 11 5)
-> (+ (cc-rek -39 5)
      (cc-rek 11 4))
   (+ 0
      (cc-rek 11 4))
   (cc-rek 11 4)
-> (+ (cc-rek -14 4)
      (cc-rek 11 3))
   (+ 0
      (cc-rek 11 3))
   (cc-rek 11 3)
-> (+ (cc-rek 1 3)
      (cc-rek 11 2))
-> (+ (+ (cc-rek -9 3)
         (cc-rek 1 2))
      (cc-rek 11 2))
   (+ (+ 0
         (cc-rek 1 2))
      (cc-rek 11 2))
   (+ (cc-rek 1 2)
      (cc-rek 11 2))
-> (+ (+ (cc-rek -4 2)
         (cc-rek 1 1))
      (cc-rek 11 2))
   (+ (+ 0
         (cc-rek 1 1))
      (cc-rek 11 2))
   (+ (cc-rek 1 1)
      (cc-rek 11 2))
-> (+ (+ (cc-rek 0 1)
         (cc-rek 1 0))
      (cc-rek 11 2))
   (+ (+ 1
         0)
      (cc-rek 11 2))
   (+ 1
      (cc-rek 11 2))
-> (+ 1
      (+ (cc-rek 6 2)
         (cc-rek 11 1)))
-> (+ 1
      (+ (+ (cc-rek 1 2)
            (cc-rek 6 1))
         (cc-rek 11 1)))
-> (+ 1
      (+ (+ (+ (cc-rek -4 2)
               (cc-rek 1 1))
            (cc-rek 6 1))
         (cc-rek 11 1)))
   (+ 1
      (+ (+ (+ 0
               (cc-rek 1 1))
            (cc-rek 6 1))
         (cc-rek 11 1)))
   (+ 1
      (+ (+ (cc-rek 1 1)
            (cc-rek 6 1))
         (cc-rek 11 1)))
-> (+ 1
      (+ (+ (+ (cc-rek 0 1)
               (cc-rek 1 0))
            (cc-rek 6 1))
         (cc-rek 11 1)))
   (+ 1
      (+ (+ (+ 1
               0)
            (cc-rek 6 1))
         (cc-rek 11 1)))
   (+ 1
      (+ (+ 1
            (cc-rek 6 1))  ;; -> idzie po jedenym (+ (cc-rek 5 1) (cc-rek 6 0)) ... -> 1
         (cc-rek 11 1)))  ;; tak samo jak (cc 6 1)

   (+ 1
      (+ (+ 1
            1)
         1))
== 4





