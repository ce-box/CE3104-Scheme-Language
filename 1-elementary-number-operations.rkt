#|---------------------------------------------------
          ELEMENTARY NUMBER OPERATIONS
  The Scheme language has the following form with the
  functions:
          > (f arg1 arg2 arg3 ... argN)
  In the programming environment to perform the basic
  mathematical operations have the reserved functions:
  addition, subtraction, division and multiplication.
---------------------------------------------------|#

; Sum Examples (+ arg1 arg2 arg3 ... argN)
(+ 5 4)

(+ 5 4 3)

(+ 5.1 4.2 3.2) ; Up to N arguments can be received.

; Substraction Examples (- arg1 arg2 arg3 ... argN)
(- 7 4)

(- 7 4 1)

(- 7.1 4.1 2)

; Examples of multiplication (* arg1 arg2 arg3 ... argN)
(* 2 4)

(* 2 4 3)

(* 2.1 4.2 3.7)

; Examples of the division (/ arg1 arg2 arg3 ... argN)
(/ 10 2)

(/ 10 3)

(/ 10 2 2)

(/ 10.1 2 2.1)

; Any calculation you wish to perform must be presented in the format.
; For example:
;           (2 * 3 * 4) + (5 * 4) = 44

(+ (* 2 3 4) (* 5 4))
