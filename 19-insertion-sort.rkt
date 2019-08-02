#|------------------------------------------------------------------------------
                              INSERTION SORT
  Insertion sort is based on the idea that one element from the input elements
  is consumed in each iteration to find its correct position i.e, the position
  to which it belongs in a sorted array.

  It iterates the input elements by growing the sorted list at each recursive call.
    1) It compares the current element with the largest value in the sorted list.
    2) If the current element is greater, then it leaves the element in its
    place and moves on to the next element else it finds its correct position
    in the sorted list and moves it to that position.

  This is done by shifting all the elements, which are larger than the current element, in the sorted list to one position ahead
  ----------------------------------------------------------------------------|#
#lang racket

;; Insertion Sort

(define (insert-sort list)
  (cond ((null? list)
          '())
        (else (insert-sort-aux list '()))))

(define (insert-sort-aux list out)
  (cond ((null? list)
          out)
        (else
          (insert-sort-aux (cdr list)
                           (insert-sorted-list (car list) out)))))

;; Inserts an item in the list so that this is always sorted.
(define (insert-sorted-list x list)
  (cond ((null? list)
          (cons x '()))
        (( > x (car list))
          (cons (car list)
                (insert-sorted-list x (cdr list))))
        (else (cons x list))))
