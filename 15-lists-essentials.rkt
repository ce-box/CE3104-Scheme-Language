#|------------------------------------------------------------------------------
                                SCHEME LISTS
  A symbol is any valid expression. A list is a set of symbols related to each
  other. The lists have a structure that starts with an open parenthesis, it
  ends up closing parentheses, and within them are the symbols separated by
  blank spaces.

  > () ;; Empty list
  > (s1 s2 s3 s4 ... sN)

  Below we give examples of functions that provides a Scheme for working with
  lists: car,cdr,c---r,cons,list,list?,equal? and null?
  ----------------------------------------------------------------------------|#

#lang racket

;; (car '(s1 s2 s3 ... sN))
;; This function returns as value the first element of the list.

(car '()) ;; -> error
(car '(1 2 3)) ;; -> 1
(car '(a b c)) ;; -> a
(car '(+ (* 2 3) (* 4 5))) ;; -> +
(car '((1 2) (3 4) (5 6))) ;; -> (1 2)

;; (cdr '(s1 s2 s3 ... sN))
;; This function returns as value the list without the first element

(cdr '()) ;; -> error
(car '(1 2 3)) ;; -> (2 3)
(car '(a b c)) ;; -> (b c)
(car '(+ (* 2 3) (* 4 5))) ;; -> ((* 2 3) (* 4 5))
(car '((1 2) (3 4) (5 6))) ;; -> ((3 4) (5 6))

;; c---r
;; the functions car and cdr can be combined to obtain a desired value

(car (car '((1 2) (3 4) (5 6))) ;; -> 1
(car (cdr '((1 2) (3 4) (5 6)))) ;; -> (3 4)

;; However, be putting these functions separately becomes a bit practical, that
;; is why there is the function c---r in which in the middle of the letter 'c'
;; and the letter 'r' you can put as many 'a' and 'd' as may be necessary to
;; combine the functions.

(caar '((1 2) (3 4) (5 6))) ;; -> 1
(cadr '((1 2) (3 4) (5 6))) ;; -> (3 4)
(caddr '((1 2) (2 3) (3 4))) ;; -> (3 4)

;; (cons s0 '(s1 s2 ... sN))
;; This function takes a symbol any and inserts it as the first element of the
;; list.

(cons 1 '( 2 3 4)) ;; -> (1 2 3 4)
(cons 'a '(b c d)) ;; -> (a b c d)
(cons '(1 2) '((3 4) (5 6))) ;; -> ((1 2)  (3 4) (5 6))
(cons '(1 2) '(a b c)) ;; -> ((1 2) a b c)

;; (list s1 s2 s3 ...sN)
;; This function is used to build lists. It receives a variable number of parameters and produces as an outcome a list with all of them as elements.

(list ) ;; -> ()
(list 1) ;; -> (1)
(list 1 2 3 4) ;; -> (1 2 3 4)
(list 'a 'b 'c 'd) ;; -> (a b c d)


;; It also has functions that act as predicates for lists:
;; * list? - Indicates whether the symbol that is passed as an argument is a list.
;; * equal? - Compares if two elements are equal.
;; * null? - Checks if the argument passed is null.

(list? '()) ;; -> #t
(list? 3) ;; -> #f
(list? '(1 2 3)) ;; -> #t
(list? (- 8 7)) ;; -> #f .. It is an operation that returns 1.

(equal? 0 0) ;; -> #t
;; This function we have already analyzed in the file "03-numerical-comparators.rkt"

(null? '()) ;; -> #t
(null? '(1)) ;; -> #f
(null? (cdr '(1))) ;; -> #t
(null? (cdr '(1 2))) ;; -> #f
