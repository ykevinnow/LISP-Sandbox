#lang racket

#| we have to define nil ourselves |#
(define nil '())

#| donot forget check null for seq |#
(define (map proc seq)
  (if (null? seq)
      nil
      (cons (proc (car seq)) (map proc (cdr seq)))))

#| check seq, learn to use 'else' |#
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq))
         (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))

(define (accumulate op init seq)
  (if (null? seq) init
      (op (car seq) (accumulate op init (cdr seq)))))

(define (enumulate-interval low high)
  (if (> low high)
      nil
      (cons low (enumulate-interval (+ low 1) high))))

#| (enumulate-interval 10 99)                                                           |#
#| (filter odd? (enumulate-interval 10 99))                                             |#
#| (map (lambda (x) (+ 2 x)) (filter odd? (enumulate-interval 10 99)))                  |#
#| (accumulate + 0 (map (lambda (x) (+ 2 x)) (filter odd? (enumulate-interval 10 99)))) |#