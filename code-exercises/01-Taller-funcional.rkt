;; Archivo: 01-Taller-funcional.rkt
;; Estudiante: Esteban Alvarado Vargas
;; ID: 2018109336
;; Instituto Tecnológico de Costa Rica

#lang racket

;; 1. Programe la función factorial
;;    0! = 1
;;    n! = n (n-1)!

> (define (fact n)
    (cond ((or (zero? n) (equal? 1 n)) 1)
    (else (* n (fact (- n 1))))))

;; 2. Programe la función Fibonacci

> (define (fib n)
    (cond ((or (zero? n) (= 1 n)) 1 )
    (else (+ (fib (- n 1)) (fib (- n 2))))))

;; 3. Programe la función miembro

> (define (miembro? elem list)
  (cond ((null? list)
        #f)
        ((equal? elem (car list))
        #t)
  (else (miembro? elem (cdr list)))))

;; 4. Programe la función eliminar

> (define (eliminar x list)
  (cond ((null? list)
          '())
        ((equal? x (car list))
          (cdr list))
        (else (cons (car list)
              (eliminar x (cdr list))))))

;; 5. Programe la función Quicksort

;; Quicksort
;; @param list_ : list to order

> (define (quick-sort list_)
  (cond ((null? list_)
          '())
        (else
          (append (quick-sort (less-than (car list_) (cdr list_)))
                  (list (car list_))
                  (quick-sort (greater-than (car list_) (cdr list_)))))))

;; less-than
;; @param pivot : item with which it compares
;; @param list_ : remaining list

> (define (less-than pivot list_)
  (cond ((null? list_)
          '())
        ((> pivot (car list_))
          (cons (car list_) (less-than pivot (cdr list_))))
        (else
          (less-than pivot (cdr list_)))))

;; greater-than
;; @param pivot : item with which it compares
;; @param list_ : remaining list

> (define (greater-than pivot list_)
  (cond ((null? list_)
          '())
        ((<= pivot (car list_))
          (cons (car list_) (greater-than pivot (cdr list_))))
        (else
          (greater-than pivot (cdr list_)))))

;; 6. Programe una función que reciba de parámetro una lista de símbolos
;; que representen los atributos de un automóvil y una lista de símbolos
;; con los valores de estos atributos. La función retornará una lista que 
;; contenga paresm cada par indica el atributo y su valor

> (define (automovil atributos valores)
    (cond ((or (null? atributos) (null? valores))
            '())
          (else
            (cons (list (car atributos) (car valores)) 
            (automovil (cdr atributos) (cdr valores))))))

;; ---------------------------------------------------------------------------------
;; 7. Programe la función eliminar un elemento de un árbol binario


;; ---------------------------------------------------------------------------------
;; 8. Programe la función eliminar un elemento de un árbol
;; NOTA: PUEDE UTILIZAR LA SIGUIENTE ESTRUCTURA PARA LAS PRUEBAS:
;; (BFS-ALL 'a 'd '((a ((b 3) (c 4))) (b ((a 3) (c 3))) (c ((b 3) (a 4) (d 5))) (d ((a 2) (b 4)))))


> (define (BFS-ALL start end graph)
   (cond ((equal? start end)
           (list start))
         (else
           (BFS-ALL-aux (list (list start)) end graph '()))))

> (define (BFS-ALL-aux paths end graph total)
   (cond ((null? paths)
           (map reverse total))
         ((solution? end (car paths))
           (BFS-ALL-aux (cdr paths)
                        end
                        graph
                        (cons (car paths) total)))
         ;; The implementation between DFS and BFS only differs in this line of code
         (else
           (BFS-ALL-aux (append (cdr paths)
                                (extend (car paths) graph))
                        end
                        graph
                        total))))

> (define (solution? end path)
    (equal? end (car path)))

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

> (define (get-neighbors node graph)
    (neighbors-to-list (node? node graph) '()))

> (define (neighbors-to-list neighbors result)
    (cond ((null? neighbors)
            result) ;; ->  (ng1 ng2 ... ngN)
          (else
            (neighbors-to-list (cdr neighbors)
                          (append result (list (caar neighbors)))))))

> (define (node? node graph)
    (cond ((null? graph)
            '())
          ((equal? node (caar graph))
            (cadar graph)) ;; -> ( (ng1 w1) (ng2 w2) ... (ngN wN) )
          (else
            (node? node (cdr graph)))))
;; ---------------------------------------------------------------------------------

