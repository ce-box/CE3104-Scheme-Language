#|------------------------------------------------------------------------------
                              SELECTION SORT
  The selection sort algorithm sorts a list by repeatedly finding the minimum
  element (considering ascending order) from unsorted part and putting it at
  the beginning. The algorithm maintains two sublist in a given list.

  1) The sublist which is already sorted.
  2) Remaining sublist which is unsorted.

  In every recurtion call of selection sort, the minimum element (considering
  ascending order) from the unsorted sublist is picked and moved to the sorted
  sublist.

  ** In this implementation there are two sublists but that is going to build a
  new list that is already sorted.
  ----------------------------------------------------------------------------|#
#lang racket

;; (selection-sort list)

(define (sel-sort list)
  (cond ((null? list)
          '())
        (else
          (cons (min? list)
                (sel-sort (remove-first
                  (min? list) list))))))

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
