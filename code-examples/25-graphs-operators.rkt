#|------------------------------------------------------------------------------
                    GRAPHS IN FUNCTIONAL PROGRAMMING
  A graph G consists of a set of nodes that we call N and edges / arcs that
  connect them. It is possible that a graph has arcs of a node v to w as well
  as w to v. In these cases both arcs can be represented, or the direction of
  the arc will be ignored.

  The graph structure is defined as:
  ( (node1 (neighbour1 neighbour2 ... neighbourN )) ... (nodeN(ng1 ...ngN))))

  A graph has elementary operations:

    * solution? - Indicates if a given path is a solution for the graph
    * neighbors? - Indicate if two nodes are neighbors
    * get-neighbors - Returns all neighbors of a given node
    * extend - Find new paths from a certain path
    * weight-btw-nodes - Returns the weight between two nodes
    * path-weight - Returns the weight of a given path
    * node? - Check if a node is part of a graph and returns his neighbors

  The functions implemented were inspired by the book: "Introducción a la
  programación en Scheme"(José E. Helio Guzmán)
------------------------------------------------------------------------------|#
#lang racket

(provide solution?
         neighbors?
         get-neighbors
         extend
         weight-btw-nodes
         path-weight)

;; (solution? end path)
;; Indicates if a given path is a solution for the graph
> (define (solution? end path)
    (equal? end (car path)))

;; (neighbors? node1 node2 graph)
;; Indicate if two nodes are neighbors
> (define (neighbors? node1 node2 graph)
    (cond ((null? graph)
            #f)
          ((equal? node1 (caar graph))
            (neighbors-aux node2 (cadar graph)))
          (else
            (neighbors? node1 node2 (cdr graph)))))

> (define (neighbors-aux node direct-ngbs)
    (cond ((null? direct-ngbs)
            #f )
          ((equal? node (caar direct-ngbs))
            #t)
          (else
            (neighbors-aux node (cdr direct-ngbs)))))

;; (node? node graph)
;; Check if a node is part of a graph and returns his neighbors
> (define (node? node graph)
    (cond ((null? graph)
            '())
          ((equal? node (caar graph))
            (cadar graph)) ;; -> ( (ng1 w1) (ng2 w2) ... (ngN wN) )
          (else
            (node? node (cdr graph)))))

;; (get-neighbours node graph)
;; Returns all neighbors of a given node
> (define (get-neighbors node graph)
    (neighbors-to-list (node? node graph) '()))

> (define (neighbors-to-list neighbors result)
    (cond ((null? neighbors)
            result) ;; ->  (ng1 ng2 ... ngN)
          (else
            (neighbors-to-list (cdr neighbors)
                          (append result (list (caar neighbors)))))))

;; (extend path graph)
;; Find new paths from a certain path
;; Check if the element exists in the partial route, to avoid cyclical evaluations
> (define (extend path graph)
    (extend-aux (get-neighbors (car path) graph) '() path))

> (define (extend-aux neighbors result path)
    (cond ((null? neighbors)
            result)
          ;; Check if the element exists in the partial route, to avoid
          ;; cyclical evaluations
          ((member (car neighbors) path)
            (extend-aux (cdr neighbors) result path))
          (else
            (extend-aux (cdr neighbors)
            (append result (list(list* (car neighbors) path)))
            path ))))

;; (weight-btw-nodes node1 node2 graph)
;; Returns the weight between two nodes
> (define (weight-btw-nodes node1 node2 graph)
    (cond ((null? graph)
            0)
          ((equal? node1 (caar graph))
            (wbn-aux node2 (cadar graph)))
          (else
            (weight-btw-nodes node1 node2 (cdr graph)))))

> (define (wbn-aux node direct-ngbs)
    (cond ((null? direct-ngbs)
            0 )
          ((equal? node (caar direct-ngbs))
            (cadar direct-ngbs))
          (else
            (wbn-aux node (cdr direct-ngbs)))))

;; (path-weight path graph)
;; Returns the weight of a given path
> (define (path-weight path graph)
    (cond ((<= (length path) 1)
            0)
          (else
            (+ (weight-btw-nodes (car path) (cadr path) graph)
                (path-weight (cdr path) graph)))))
