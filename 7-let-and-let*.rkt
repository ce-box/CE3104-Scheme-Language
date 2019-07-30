#lang racket
#|---------------------------------------------------
                      LET AND LET*
  In a special way let has the following syntax:

      (let
        ((<ident-1> <exp-1>)
          ...
         (<ident-n> <exp-n>))
       <body>)

  This special form allows to define local variables,
  give them a value and evaluate an expression with
  that defined value.

  [!] The use of let allows to make the programs more
  readable, since we can define some previous concepts
  necessary before defining the body of the function.

  The special form let * is a variant of the let that
  does allow the sequential definition of values ​​to
  local variables.
  ---------------------------------------------------|#

;; f(x,y) = y(1-y) + (1-y)(1+y) + 2 x (1+y)**2

(define (f x y)
    (let ((a (- 1 y))
         (b (+ 1 y)))
    (+ (* y a) (* a b) (* 2 x b b))))

;; Triangle surface

(define (triangle-surface b h)
    (/ (* b h) 2))

;; Hexagon area

(define (hex-surface side)
    (let ( (const (* 3 (sqrt 3)))
           (side2 (* side side)))
    (/ (* const side2) 2)))

;; Differences btw let and let*

(define (func1)
    (let (
      (a (+ 2 4))
      (b (+ 2 a)))
    b)) ;; This error --> a is not defined

(define (func2)
    (let* (
      (a (+ 2 4))
      (b (+ 2 a))) ;; It asings the variables in sequential order.
    b))
