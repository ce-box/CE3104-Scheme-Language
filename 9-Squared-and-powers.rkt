#|---------------------------------------------------
               SQUARED AND POWERS
  Mathematical functions implemented and an introduc-
  tion to recursion in the functional paradigm.
  ---------------------------------------------------|#
#lang racket

;; Function that squares the value of a number
;; (squared x)
;; x: integer

(define (squared x)
    (* x x))

;; Function that raises the value x to the power of y
;; (power x y)
;; x: real ; y: integer w/ y >= 0
;; x**y = x * (x** (y-1)) = x*(x*(x** (y-2)))=x*(x*(x*....(x**0)))
;; Recursion -> A function that calls itself while a condition is true.

(define (power x y)
    (cond ((zero? y) 1)
    (else (* x (power x (- y 1))))))
