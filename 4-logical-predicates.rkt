#|---------------------------------------------------
                NUMERICAL COMPARATORS
  Logical predicates are functions that implement the
  main connectives of Boolean logic. They receive true
  or false entries and produce them on their departure.
  In the Scheme language we have:
  and, or, not.
---------------------------------------------------|#

;; (and arg1 arg2 ... argN)

(and ) ;; ->#t
(and #f #f) ;; ->#f
(and #f #t) ;; ->#f
(and #t #f) ;; ->#f
(and #t #t) ;; ->#t

;; (or arg1 arg2 ... argN)

(or ) ;; ->#f
(or #f #f) ;; ->#f
(or #f #t) ;; ->#t
(or #t #f) ;; ->#t
(or #t #t) ;; ->#t

;; (not arg1)

(not #t) ;; -> #f
(not #f) ;; -> #t
