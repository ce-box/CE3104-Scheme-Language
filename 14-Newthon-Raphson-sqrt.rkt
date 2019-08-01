#|------------------------------------------------------
             SQUARE ROOTS - NEWTON RAPHSON
   This method to find the square root of a numberit is
  more efficient than the method of splitting.

  A. The algorithm starts with an initial solution of 1.
  B. If it meets the criterion of decision is presented as a
  solution.
            | number - (aprox)^2 | <= error

  C. Otherwise it must generate a better appro-
  ximation until it is able to satisfy the criterion of
  solution.
                Xo = 1
                X(n+1) = (½) (Xn + y/Xn)

  ------------------------------------------------------
  Note: This algorithm uses the queue recursion because
  it does not require a prior value to provide a solution.
  ------------------------------------------------------|#

#lang racket

;;Calculates the square root of a number with a margin of error.
;; y: number, y > 0
;; err: error margin, err > 0

(define (sqrt-N-R y err)
  (sqrt-aux 1 y err))

;; Auxiliar function
;; Performs the calculation of successive approximations by
;; using recursive calls

(define (sqrt-aux x y err)
  (cond ((good-apprx? x y err)
        x)
  (else (sqrt-aux (new-apprx x y) y err))))

;; Determines whether the approximation is sufficiently close to x

(define (good-apprx? x y err)
  (<= (abs(- y (* x x))) err))

;; Constructs a new (closer) approximation

(define (new-apprx x y)
  (* (/ 1 2) (+ x (/ y x))))
