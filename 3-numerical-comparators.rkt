#|---------------------------------------------------
                NUMERICAL COMPARATORS
  Predicates are functions that return functions to
  true [#t] or false [#f] value.
  The main language predicates are presented below:
  =, equal?, <,>, <=,>=,zero?, positive?, negative?,
  even? , odd?, integer? and real?.
---------------------------------------------------|#

;; To compare if n elements are equal use (= arg1 arg2 ... argN)

(= 7 7) ;; -> #t
(= 0 (- 7 7)) ;; -> #t
(= 0 (- 7 6)) ;; -> #f
(= 0 (- 7 6) (- 6 (+ 2 4))) ;; -> #t

;; To compare alone and only if two elements are equal (equal? arg1 arg2)

(equal? 7 7) ;; -> #t
(equal? 0 (- 7 6)) ;; -> #f

;; To corroborate the order relationship between two or more
;; elements we have:
;; 1) (< arg1 ... argN)

( < 1 2) ;; -> #t
( < 2 1) ;; -> #f

;; 2) (<= arg1 ... argN)

( <= 1 2) ;; -> #t
( <= 2 1) ;; -> #f
( <= 1 1) ;; -> #t

;; 3) (> arg1 ... argN)

( > 2 1) ;; -> #t
( > 1 2) ;; -> #f

;; $) (>= arg1 ... argN)

( >= 1 2) ;; -> #f
( >= 2 1) ;; -> #t
( >= 1 1) ;; -> #t


;; To verify if a number is zero, positive or negative we have:

;; A) (zero? arg1)

(zero? 2) ;; -> #f
(zero? 0) ;; -> #t
(zero? (- 2 2)) ;; -> #f

;; B) (positive? arg1)

(positive? 2) ;; -> #t
(positive? 0) ;; -> #f
(positive? 5) ;; -> #t

;; C) (negative? arg1)

(negative? -2) ;; -> #t
(negative? 0) ;; -> #f
(negative? 5) ;; -> #f

;; Scheme allows us to know if a number is even or odd with:
;; (even? arg1) & (odd? arg1)

(even? 2) ;; -> #t
(even? 3) ;; -> #f
(odd? 2) ;; -> #f
(odd? 3) ;; -> #t

;; With the numbers we can verify if they are integer or real numbers.

(number? 5) ;; -> #t
(integer? 4) ;; -> #t
(integer? 4.12) ;; -> #f
(real? 89) ;; -> #t
