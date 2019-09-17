#|------------------------------------------------------------------------------
                        RATIONAL NUMBERS ARITHMETIC
  In this example are programmed functions that allow us to create rational
  numbers with their parts: numerator / denominator, simplify rational numbers
  and to determine if two rational numbers are equal.
  At last we implement functions to add, subtract, divide, and multiply these numbers.
  ----------------------------------------------------------------------------|#

#lang racket

;; 1. Greatest common divisor
;; a, b : Integer numbers

(define (gcd a b)
  (cond ((zero? b)
        a)
  (else (gcd b (remainder a b)))))

;; 2. Make a number rational
;; n: numerator - d: denominator

(define (make-rat n d)
  (let ((grtcd (gcd n d)))
  (list (/ n grtcd) '/ (/ d grtcd))))

;; 3. Returns the numerator
;; q: rational number ( n / d )

(define (num-of q)
  (car q))

;; 4. Returns the denominator
;; q: rational number ( n / d )

(define (den-of q)
  (caddr q))

;; 5. Are two rational numbers equal?
;; n1/d1 = n2/d2 <=> (n1d2 = n2d1)

(define (equal-rat? q1 q2)
  (equal? (* (num-of q1) (den-of q2))
          (* (num-of q2) (den-of q1))))

;; 6. Add two rational numbers
;; n1/d1 + n2/d2 = [(n1*d2)+(n2*d1)] /(d1*d2)

(define (add-rat q1 q2)
   (make-rat (+ (* (num-of q1) (den-of q2))
                (* (num-of q2) (den-of q1)))
             (* (den-of q1) (den-of q2))))

;; 7. Subtract two rational numbers
;; n1/d1 - n2/d2 = [(n1*d2)-(n2*d1)] /(d1*d2)

(define (sub-rat q1 q2)
  (make-rat (- (* (num-of q1) (den-of q2))
               (* (num-of q2) (den-of q1)))
            (* (den-of q1) (den-of q2))))

;; 8. Multiply two rational numbers
;; n1/d1 * n2/d2 = (n1*n2) /(d1*d2)

(define (mult-rat q1 q2)
  (make-rat (* (num-of q1) (num-of q2))
            (* (den-of q1) (den-of q2))))

;; 9. Divide two rational numbers
;; (n1/d1) / (n2/d2) = (n1d2)/(n2d1)

(define (div-rat q1 q2)
  (make-rat (* (num-of q1) (den-of q2))
            (* (num-of q2) (den-of q1))))

;; At the time of passing the parameters must be as shown in the first line,
;; otherwise the interpreter will not recognize that it is a list.

;; > (add-rat '(1 / 2) '(1 / 2)) <- Do
;; '(1 / 1)
;; > (add-rat (1 / 2) (1 / 2)) <- Don't
;; error
