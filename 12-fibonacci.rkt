#|---------------------------------------------------
                FIBONACCI'S SERIES
  The fibonacci's serie is defined as:

            fib(0) = 1
            fib(1) = 1
            fib(n) = fib(n-1)+fin(n-2)
  ---------------------------------------------------|#
#lang racket

;; Fibonacci [recursive]
;; fib(n)
;; n >= 0

(define (fib n)
    (cond ((or (zero? n) (= 1 n)) 1 )
    (else (+ (fib (- n 1)) (fib (- n 2))))))
