#|------------------------------------------------------------------------------
                        LIST OPERATORS & FUNCTIONS
  The lists are one of the most useful elements in programming, and it is
  necessary to perform certain operations on them as insert elements, delete
  elements, select elements, check if an element is part of the list, to know
  the length of the list, etc.

  Note: Many of these functions are already integrated as part of the
  scheme language, but are implemented for teaching purposes.
  ----------------------------------------------------------------------------|#
#lang racket

(provide apply-fun)

;; (member? ele list)
;; Checks if an element is part of the list

;; [!] Remember that to pass a list as an argument we must use the function
;; quote: (member? ele '(s1...sN))

(provide member?) ;;You can use provide within a module to export definitions.
(define (member? elem list)
  (cond ((null? list)
        #f)
        ((equal? elem (car list))
        #t)
  (else (member? elem (cdr list)))))

;; (length? list)
;; Returns the length of the list

(define (length? list)
  (cond ((null? list) 0)
  (else (+ 1 (length? (cdr list))))))

;; (get index list)
;; Returns the n-th element of the list
;; If the item is not found in the list return -1

(define (get index list)
  (cond ((null? list)
        -1)
        ((equal? index 1)
        (car list))
        (else (get (- index 1) (cdr list)))))

;; (get-last list)
;; Extracts the last element of list

(define (get-last-1 list)
  (get (length? list) list))

(define (get-last-2 list)
  (cond ((null? list)
        -1)
        ((null? (cdr list))
        (car list))
        (else (get-last-2 (cdr list)))))

;; (get-even list)
;; Get the even numbers from a list

(define (get-even list)
  (cond ((null? list)
         '())
        ((even? (car list))
         (cons (car list)
              (get-even (cdr list))))
        (else (get-even (cdr list)))))

;; (join-list list1 list2)
;; Joins two lists while keeping the order

(define (join-list list1 list2)
  (cond ((null? list1)
          list2)
        ((null? list2)
          list1)
        (else (cons (car list) (join-list (cdr list1))))))

;; (reverse list)
;; Is in charge of reversing the order of a list

(define (reverse list)
  (cond ((null? list)
          '())
        (else (append (reverse (cdr list))
                      (list (car list))))))

;; (apply-fun f list)
;; Applies a function to elements of a list

(define (apply-fun f list)
    (cond ((null? list)
            '())
          (else (cons (f (car list))
                      (apply-fun f (cdr list))))))

;; (max? list)
;; Find the highest element in a list

(define (max? list)
  (cond ((null? list)
          #f)
        (else (max-aux (car list) (cdr list)))))

(define (max-aux x list)
    (cond ((null? list)
            x)
          (( > (car list) x)
            (max-aux (car list) (cdr list)))
          (else (max-aux x (cdr list)))))

;; (min? list)
;; Find the lowest element ina lists

(define (min? list)
  (cond ((null? list)
          #f)
        (else (min-aux (car list) (cdr list)))))

(define (min-aux x list)
    (cond ((null? list)
            x)
          (( < (car list) x)
            (min-aux (car list) (cdr list)))
          (else (min-aux x (cdr list)))))

;; (remove-first list)
;; Removes the first occurrence of the element in a list

(define (remove-first x list)
  (cond ((null? list)
          '())
        ((equal? x (car list))
          (cdr list))
        (else (cons (car list)
              (remove-first x (cdr list))))))

;; (remove-all x list)
;; Removes all occurrences of element in a list

(define (remove-all x list)
  (cond ((null? list)
          '())
        ((equal? x (car list))
          (remove-all x (cdr list)))
        (else (cons (car list)
                    (remove-all x (cdr list))))))
