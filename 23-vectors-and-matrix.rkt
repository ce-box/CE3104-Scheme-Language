;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 23-vectors-and-matrix) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#|------------------------------------------------------------------------------
                         VECTORS AND MATRIX (ALGEBRA)
  (a) Vectors
  A vector is an array of numbers of the form:
          V = [v [1] v [2] ... v [n]]
  Which is represented as a list:
          V = (v [1] v [2] ... v [n])
  The elements v [i] are called components. If all components are equal to 0
  then this vector is called a null vector.

  Two vectors are the same if they have the same components, in the same order.

  (b) Matrix
  A matrix is ​​a rectangular arrangement of the form:

            0 1 2 3 4
        0 | a b c d e |
   M =  1 | f g h i j |  => M(0,3) = d
        2 | k l m n o |

  A matrix has rows (horizontal vectors) and columns (vertical vectors). The
  size of an array is n rows and m columns, represented as M (nxm).

  An element of the matrix is ​​located according to the row and the column it is
  in, it is represented: M [i] [j].

  This module shows the main functions on vectors and matrix.
  ----------------------------------------------------------------------------|#



;; (equal-vec? v1 v2)
;; Determine if two vectors are equal

(define (equal-vec? v1 v2)
  (cond ((and (null? v1) (null? v2))
          #t)
        ((or (null? v1) (null? v2))
          #f)
        ((not (equal? (car v1) (car v2)))
          #f)
        (else
          (equal-vec? (cdr v1) (cdr v2)))))

;; (vector-add v1 v2)
;; Add two vectors

(define (vector-add v1 v2)
  (cond ((and (null? v1) (null? v2))
          '())
        (else
          (cons (+ (car v1) (car v2))
                (vector-add (cdr v1) (cdr v2))))))

;; (vector-mult v1 v2)
;; "Dot product"
;; Multiply two vectors

(define (vector-mult v1 v2)
  (cond ((and (null? v1) (null? v2))
          0)
        (else
          (+ (* (car v1) (car v2))
             (vector-mult (cdr v1) (cdr v2))))))

;; Transposed Matrix
;; (trans-matrix M)
;; Returns the transpose of a matrix

(define (trans-matrix M)
  (cond ((null? (car M))
          '())
        (else
          (cons (get-first-of-rows M)
                (trans-matrix (delete-first-of-rows M))))))

(define (get-first-of-rows M)
  (cond ((null?  M)
          '())
        (else
          (cons (caar M) (get-first-of-rows (cdr M))))))

(define (delete-first-of-rows M)
  (cond ((null? M)
          '())
        (else
          (cons (cdar M) (delete-first-of-rows (cdr M))))))

;; (mult-vect-matrix v M)
;; Multiply a vector by a matrix.

(define (mult-vect-matrix v M)
  (mult-vect-matrix-aux v (trans-matrix M)))

(define (mult-vect-matrix-aux v M)
  (cond ((null? M)
          '())
        (else
          (cons (vector-mult v (car M))
                (mult-vect-matrix-aux v (cdr M))))))

;; (matrix-mult M1 M2)
;; Perform the multiplication of two matrix.

(define (matrix-mult M1 M2)
  (cond ((null? M1)
          '())
        (else
          (cons (mult-vect-matrix (car M1) M2)
                (matrix-mult (cdr M1) M2)))))
