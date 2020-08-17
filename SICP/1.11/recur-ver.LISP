#lang racket

(define (recur-ver n)
  (if (< n 3)
       n
       (+ (recur-ver (- n 1)) (* 2 (recur-ver (- n 2))) (* 3 (recur-ver (- n 3))))))