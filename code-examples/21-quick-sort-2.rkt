#|------------------------------------------------------------------------------
                                QUICK SORT
  Quick sort is based on the divide-and-conquer approach based on the idea of
  choosing one element as a pivot element and partitioning the array around it
  such that: Left side of pivot contains all the elements that are less than
  the pivot element Right side contains all elements greater than the pivot

  It reduces the space complexity and removes the use of the auxiliary list
  that is used in merge sort. Selecting a random pivot in an array results in
  an improved time complexity in most of the cases.

  This implementation avoids the use of let and let * in programming, making it
  a completely recursive algorithm and adapted successfully to the functional
  programming paradigm.
  ----------------------------------------------------------------------------|#
#lang racket

;; Quicksort
;; @param list_ : list to order

(define (quick-sort list_)
  (cond ((null? list_)
          '())
        (else
          (append (quick-sort (less-than (car list_) (cdr list_)))
                  (list (car list_))
                  (quick-sort (greater-than (car list_) (cdr list_)))))))

;; less-than
;; @param pivot : item with which it compares
;; @param list_ : remaining list

(define (less-than pivot list_)
  (cond ((null? list_)
          '())
        ((> pivot (car list_))
          (cons (car list_) (less-than pivot (cdr list_))))
        (else
          (less-than pivot (cdr list_)))))

;; greater-than
;; @param pivot : item with which it compares
;; @param list_ : remaining list

(define (greater-than pivot list_)
  (cond ((null? list_)
          '())
        ((<= pivot (car list_))
          (cons (car list_) (greater-than pivot (cdr list_))))
        (else
          (greater-than pivot (cdr list_)))))
