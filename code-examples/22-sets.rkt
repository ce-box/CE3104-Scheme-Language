#|------------------------------------------------------------------------------
                            SETS (MATH CONCEPT)
  A set is a collection of objects, which are called "elements of the set."
  In Scheme, lists are used to represent sets. An empty set {} is represented by
  the null list ().
  Any set is represented as follows:
  {e1, e2, e3, ..., eN}
  It is implemented like this:
  (e1, e2, e3, ..., eN)

  As in mathematical sets, sets in Scheme must meet the following conditions:
  (1) No repeated items.
  (2) There is no order relationship between the elements.
  (3) Two sets are equal if and only if they have the same elements. (Regardless
  of the order)

  In this module the basic functions for the handling of sets will be presented.
  ----------------------------------------------------------------------------|#

#lang racket
(require "17-lists-operators.rkt")

;; (set? set)
;; Determine whether or not a set is received
;; @param set - item to check

;; [!] Determine if a list meets the conditions to be a set.

(define (set? set)
  (cond ((null? set)
          #t)
        ((member? (car set) (cdr set))
          #f)
        (else
          (set? (cdr set)))))

;; (equal-set? set1 set2)
;; Determine if two given sets are equal
;; @param set1
;; @param set2

(define (equal-set? set1 set2)
  (cond ((or (not (set? set1))
             (not (set? set2)))
          #f)
        ((null? set1)
          #t)
        ((not (member? (car set1) set2))
          #f)
        (else
          (equal-set? (cdr set1) set2))))

;; (set-union set1 set2)
;; Makes a set of all things that are members of either set1 or set2.

(define (set-union set1 set2)
  (cond ((null? set1)
          set2)
        ((null? set2)
          set1)
        ((member? (car set1) set2)
          (set-union (cdr set1) set2))
        (else
          (cons (car set1) (set-union (cdr set1) set2)))))

;; (set-intersec set1 set2)
;; Makes a set determining by which members two sets have "in common".

(define (set-intersec set1 set2)
  (cond ((null? set1)
          '())
        ((null? set2)
          '())
        ((member? (car set1) set2)
          (cons (car set1) (set-intersec (cdr set1) set2)))
        (else
          (set-intersec (cdr set1) set2))))
