#|---------------------------------------------------
               PREVIOUS AND NEXT NUMBER
  The previous and next functions are very simple. What
  is desired is to enter as an argument an integer and
  receive the previous or next number.
  ---------------------------------------------------|#
#lang racket

;; Previous number function
;; (prev x)
;; x: integer number

(define (prev x)
    (- x 1))

;; Next number function
;; (next x)
;; x: integer number

(define (next x)
    (+ x 1))
