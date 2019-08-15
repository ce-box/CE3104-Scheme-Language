#|---------------------------------------------------
                        DEFINE
  The abstraction capabilities of a programming language
  make it possible to define new elements and give them
  a name. In other programming languages ​​(Java, C ++, etc.)
  it is possible to define new types of data (classes),
  define procedures and functions of those types of
  data, define constants, etc.

  In Scheme we only have one instruction to define
  new elements: define

  define syntax is:

          (define <symbol> <expression>)
  It is evaluated like this:

      a) Evaluate expression
      b) Associate the value resulting from the previous
         evaluation with the symbol

  The other use of define is to define new procedures.
  The syntax to define a function is:

          (define (<function-name> <args>)
                  <body>)
---------------------------------------------------|#
#lang racket

;; define pi value
(define pi 3.1416) ;; >pi -> 3.1416

;; Absolute value w/if

(define (abs num)
    (if (positive? num)
        num
        (* -1 num)))

;; squared num

(define (squared num)
    (* num num))

;; Sum w/lambda

(define Sum
  (lambda (num) (+ num 1))) ;; Lambda pass a function as parameter,is not the most used.

;; Sum without Lambda
(define (sum num)
    (+ 1 num)) ;; This is much better :)
