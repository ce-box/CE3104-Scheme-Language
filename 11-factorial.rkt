#|---------------------------------------------------
                      FACTORIAL
  The factorial functions is defined as:

            0! = 1
            n! = n (n-1)!
  ---------------------------------------------------|#
#lang racket

;; Factorial functions
;; (fact n)
;; n: int -> n>=0

(define (fact n)
    (cond ((or (zero? n) (equal? 1 n)) 1)
    (else (* n (fact (- n 1))))))
