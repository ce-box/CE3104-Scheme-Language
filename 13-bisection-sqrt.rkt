#|------------------------------------------------------
                SQUARE ROOTS - BISECTION
  This is one of the easiest methods to find the square
  root of a number. The method generates successive app-
  roximations value until you get one with a margin of
  error desired.
  In the code will explain more in detail each function,
  but broadly speaking the algorithm behaves in the
  following way:

  1. You will need: The number by which we seek the
     square root and the error of the approximation.

  2. The algorithm takes a approximation value, by divi-
     ding by half the interval.

              Xo = (inf_lim + sup_lim)/2

  3. Then it evaluates the approximation, if your error
     is less than or equal to the given value, it is a
     useful value and is therefore returned as a solution.

          | number - (aprox)^2 | <= error

  4. If it is not a proper value, it proceeds to compute
     a new value (Step 1). If the approximation is incre-
     ased, take the lower limit and the approximation as
     the upper. If less, you take it as the lower appro-
     ximation and the upper is maintained.

  ------------------------------------------------------
  Note: This algorithm uses the queue recursion because
  it does not require a prior value to provide a solution.
  ------------------------------------------------------|#

#lang racket

;; Square Root - Bisection
;; Calculates the square root of a number with a margin of error.
;; x: number, x > 0
;; err: error margin, err > 0

(define (sqrt-bis x err)
  (sqrt-aux 0 x (/ x 2) x err))

;; Auxiliar function
;; Performs the calculation of successive approximations by
;; using recursive calls
;; low_lim: lower limit
;; upp_lim: upper limit
;; apprx:  approximation
;; err : error

(define (sqrt-aux low_lim upp_lim apprx x err)
  (cond ((is-good-apprx? apprx x err)
          apprx)
        (( > (* apprx apprx) x)
          (sqrt-aux low_lim apprx (new-apprx low_lim apprx) x err))
        ((< (* apprx apprx) x)
          (sqrt-aux apprx upp_lim (new-apprx apprx upp_lim) x err))))

;; Determines whether the approximation is sufficiently close to x

(define (is-good-apprx? apprx x err)
  (<= (abs (- x (* apprx apprx))) err))

;; Constructs a new approximation based on the two limits

(define (new-apprx low_lim upp_lim)
  (/ (+ low_lim upp_lim) 2))
