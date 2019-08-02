#|------------------------------------------------------------------------------
                                QUICK SORT
  Quick sort is based on the divide-and-conquer approach based on the idea of
  choosing one element as a pivot element and partitioning the array around it
  such that: Left side of pivot contains all the elements that are less than
  the pivot element Right side contains all elements greater than the pivot

  It reduces the space complexity and removes the use of the auxiliary array
  that is used in merge sort. Selecting a random pivot in an array results in
  an improved time complexity in most of the cases.
  ----------------------------------------------------------------------------|#
#lang racket

;; Quick Sort

(define (quick-sort list_)
  (cond ((null? list_)
          '())
        (else
          (let* ;; These let can be omitted, placing the corresponding functions
            ((point (car list_))
            (min-of-max (pivot list_))
            (mins (car min-of-max))
            (maxs (cadr min-of-max)))

          (append (quick-sort mins) (list point) (quick-sort maxs))))))

;; Pivot
;; Takes the first element of the list and separates the lowers and greaters.

(define (pivot list_)
  (cond ((null? list_)
          #f)
        (else
          (pivot-aux (car list_) (cdr list_) '() '()))))

(define (pivot-aux point list_ mins maxs)
  (cond ((null? list_)
          (list mins maxs))
        ((<= (car list_) point)
          (pivot-aux point (cdr list_) (cons (car list_) mins) maxs))
        (else
          (pivot-aux point (cdr list_) mins (cons (car list_) maxs)))))
