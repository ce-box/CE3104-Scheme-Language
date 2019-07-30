#|---------------------------------------------------
                CONTROL STRUCTURES
  Scheme also defines control structures that allow us
  to select which part of an expression we evaluate
  based on the result of the evaluation of others.

  Scheme's most important structures are the if and
  the cond for a conditional evaluation.
---------------------------------------------------|#

;; IF STATEMENT |
;; The syntax of if is:

;;(if <condition> <exp- truth> <exp-false>)
;;The operation of the special form is:

;; 1. Evaluate condition
;; 2. If the result is true evaluate exp-true
;; 3. Else evaluate exp-false

(if (> 3 2)
    (* 2 3)
    (/ 2 0))

(if ( > x 5)
    'greater-than-five
    'lower-or-equal-to-five)

;; COND STATEMENT |
;; The special form cond evaluates a series of conditions
;; and returns the value of the expression associated with
;; the first true condition.

;; The syntax of cond is as follows:

;; (cond
;;    (<exp-cond-1> <exp-consec-1>)
;;    (<exp-cond-2> <exp-consec-2>)
;;     ...
;;    (else <exp-consec-else>))

;; The semantics are as follows:

;; 1. All expressions are evaluated in an orderly manner until one of them returns #t
;; 2. If any expression returns #t, the consequent value of that expression is returned
;; 3. If no expression is true, the value resulting from evaluating the consequent 'else' is returned

; ding GAME: 1,2,ding,4,5,ding,7,8,ding,10,11,ding,ding,14,ding,...

(define (ding x)
   (cond
      ((= (remainder x 3) 0) 'ding)
      ((member? 3 x) 'ding)
      (else x)))

; Absolute value

(define (abs num)
  (cond
    ( ( >= num 0)
     num)
    (else 
      (* -1 num))))
