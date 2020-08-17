#lang racket
(define (iter-ver n)
  (tail-recur 2 1 0 3 n))

(define (tail-recur a b c count n)
  (cond ((< n 3) n)
        ((< n count) a)
        (else (tail-recur (+ a (* 2 b) (* 3 c)) a b (+ count 1) n))))

