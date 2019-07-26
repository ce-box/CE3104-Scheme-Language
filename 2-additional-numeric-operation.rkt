#|---------------------------------------------------
          ADDITIONAL NUMERIC OPERATIONS
  The Scheme language has another set of numerical
  operations more complex than basic mathematics.
  In the programming environment to perform the addi-
  tional mathematical operations have the reserved
  these functions:
  abs, min, max, truncate, round, quotient, remainder,
  expt and sqrt.
---------------------------------------------------|#

; Absolute value Examples (abs arg1)

(abs 0)

(abs 5)

(abs -5)

; Minimun value Examples (min arg1 arg2 arg3 ... argN)

(min 0 3) ; -> 0
(min 4 3 1 7) ; -> 1
(min 1 2 3 4 3 2 1) ; -> 1

; Maximun value Examples (max arg1 arg2 arg3 ... argN)

(max 1 7) ; -> 7
(max 1 7 5) ; -> 7
(max 1 2 3 4 5 3 1) ; -> 5

; Truncate value Examples (truncate arg1)

(truncate 10.33) ; -> 10
(truncate 10.50) ; -> 10
(truncate 10.78) ; -> 10

; Round value Examples (round arg1)

(round 10.33) ; -> 10
(round 10.50) ; -> 11
(round 10.78) ; -> 11
