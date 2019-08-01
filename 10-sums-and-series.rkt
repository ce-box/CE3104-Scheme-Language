#|---------------------------------------------------
               SUMS AND SERIES
  In these modules you will see examples of series of
  sums that allow you to apply a recursive solution.
  ---------------------------------------------------|#
#lang racket

;; #1. Sums series from 0 to n
;; Σ i from i = 0 to n -> 0 + 1 + 2 + 3 +...+ n

(define (add-up-to n)
   (cond ((zero? n) 0)
   (else (+ n (add-up-to (- n 1))))))

;; #2. Squared series
;; Σ i^​2 from i = 0 to n -> 0 + 1 + 4 + 9 +...+ n^​2

(define (sqr x)
    (* x x))

(define (sqr-sum n)
    (cond ((zero? n) 0)
    (else (+ (sqr n) (sqr-sum (- n 1))))))

;; #3. Quotient Series
;; Σ 1/i(1+1) from i = 1 to n -> 1/2 + 1/6 + 1/12 +...+1/n(n+1)

(define (quotient-sum n)
    (let* ((i (+ n 1))
          (j (* n i)))
    (cond ((zero? n) 0)
    (else
    (+ (/ 1 j) (quotient-sum (- n 1)))))))

;; #4. Summation in an interval
;; Σ i from i = a to n = b -> a + (a+1) + (a+2) + (a+3) +...+ b

(define (interval-sum a b)
    (cond ((equal? a b) b)
    (else (+ a (interval-sum (+ a 1) b)))))

;; #5. Sum of a function
;; ;; Σ f(x) from i = a to n = b -> f(a) + f(a+1) + f(a+2) + f(a+3) +...+ f(b)

(define (sum-func fun a b)
    (cond ((equal? a b) a)
    (else (+ (fun b) (sum-func fun a (- b 1))))))

;; Extra
(define (next num)
    (+ num 1))
