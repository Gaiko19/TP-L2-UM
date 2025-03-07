#lang racket
;;;;;;;;;;;;;;;
; Exercice 1  ;
;;;;;;;;;;;;;;;
(define (puis2 x)
  (* x x))
;(+ taille 7)
; Produit une erreur car la variable taille n'est pas définie
(define taille 4)
; rien
taille
; 4
(puis2 taille)
; 16
taille
; 4
(define taillebis taille)
; rien
taillebis
; 4
;(define taille 8)
; rien
taille
; 8
taillebis
; 4
(+ taille taillebis)
; 12

;;;;;;;;;;;;;;;
; Exercice  2 ;
;;;;;;;;;;;;;;;
(define x 5)
(define (f x) (* x x))
(f 10) ; 100

;;;;;;;;;;;;;;;
; Exercice  3 ;
;;;;;;;;;;;;;;;
(define d 1)
(define (plusd x) (+ x d))
(plusd 10) ; 11

;;;;;;;;;;;;;;;
; Exercice  4 ;
;;;;;;;;;;;;;;;
(define d2 5)
(plusd 10) ; 15

;;;;;;;;;;;;;;;
; Exercice  5 ;
;;;;;;;;;;;;;;;
(define (h x) (* x x))
(define (g x) (+ 1 (h x)))
(g 10) ; 101

; Changer l'ordre des définitions ne change rien

;;;;;;;;;;;;;;;
; Exercice  6 ;
;;;;;;;;;;;;;;;
(/ 1 3) ; 1/3
(/ 1.0 3) ; 0.3333333333333333
(/ 2 6) ; 1/3
(exact->inexact (/ 1 3)) ; 0.3333333333333333
(inexact->exact 0.5) ; 1/2
(/ 3 2) ; 1 1/2

;;;;;;;;;;;;;;;
; Exercice  7 ;
;;;;;;;;;;;;;;;

(define monabs
  (lambda (x)
    (if (<= 0 x)
        x
        (- x))))

(monabs (- 12)) ; 12
(monabs 34) ; 34

;;;;;;;;;;;;;;;
; Exercice  8 ;
;;;;;;;;;;;;;;;

(define care-div
  (lambda (a b)
    (if (= 0 b)
        (display "On ne peut pas diviser par 0")
        (/ a b))))

(care-div 78 3) ; 26
(care-div 78 0) ; On ne peut pas diviser par 0

;;;;;;;;;;;;;;;
; Exercice  9 ;
;;;;;;;;;;;;;;;
(newline)
(define signal
  (lambda (t)
    (cond 
      ((and (< (- 3) t) (>= (- 1) t)) 1)
      ((and (< 2 t) (>= 4 t)) 2)
      (else 0))))

(signal (- 12)) ; 0
(signal (- 3)) ; 0
(signal (- 2)) ; 1
(signal (- 1)) ; 1
(signal 0) ; 0
(signal 2) ; 0
(signal 3) ; 2
(signal 4) ; 2
(signal 5) ; 0

;;;;;;;;;;;;;;;
; Exercice 10 ;
;;;;;;;;;;;;;;;

(define placement
  (lambda (capital taux duree)
    (* capital (expt (+ 1 taux) duree))))

; on place 100 euro à un taux de 5% pendant 3 ans
(placement 100 0.05 3) ; 115.76250000000002

;;;;;;;;;;;;;;;
; Exercice 11 ;
;;;;;;;;;;;;;;;
(require (lib "turtles.ss" "graphics"))
(turtles #t)

(draw 1)
(turn 30)
(draw 2)
(turn 30)
(draw 3)
(turn 30)
(draw 4)
(turn 30)
(draw 5)
(turn 30)
(draw 6)
(turn 30)
(draw 7)
(turn 30)
(draw 8)
(turn 30)
(draw 9)
(turn 30)
(draw 10)
(turn 30)
(draw 11)
(turn 30)
(draw 12)
(turn 30)
(draw 13)
(turn 30)
(draw 14)
(turn 30)
(draw 15)
(turn 30)
(draw 16)
(turn 30)
(draw 17)
(turn 30)
(draw 18)
(turn 30)
(draw 19)
(turn 30)
(draw 20)
(turn 30)
(draw 21)
(turn 30)
(draw 22)
(turn 30)
(draw 23)
(turn 30)
(draw 24)
(turn 30)

;;;;;;;;;;;;;;;
; Exercice 12 ;
;;;;;;;;;;;;;;;

(define carre
  (lambda (lgr)
    (begin
      (clear)
      (draw lgr)
      (turn 90)
      (draw lgr)
      (turn 90)
      (draw lgr)
      (turn 90)
      (draw lgr))))

(carre 100)

;;;;;;;;;;;;;;;
; Exercice 13 ;
;;;;;;;;;;;;;;;

(define hexagone
  (lambda (lgr)
    (begin
      (clear)
      (draw lgr)
      (turn 60)
      (draw lgr)
      (turn 60)
      (draw lgr)
      (turn 60)
      (draw lgr)
      (turn 60)
      (draw lgr)
      (turn 60)
      (draw lgr))))

(hexagone 30)

;;;;;;;;;;;;;;;
; Exercice 14 ;
;;;;;;;;;;;;;;;

(define figure
  (lambda (lgr n)
    (let ((angle (if (= 0 n) 0 (/ 360 n))))
      (define cote 
        (lambda (l n)
          (if (< 0 n) (begin (draw l) (turn angle) (cote l (- n 1))))))
      (clear)
      (cote lgr n))))

(figure 30 10)

;;;;;;;;;;;;;;;
; Exercice 15 ;
;;;;;;;;;;;;;;;

(define bissextile?
  (lambda (annee)
    (or (= 0 (modulo annee 400))
        (and (= 0 (modulo annee 4))
             (not (= 0 (modulo annee 100)))))))

(bissextile? 2000) ; #t
(bissextile? 2008) ; #t
(bissextile? 1900) ; #f

;;;;;;;;;;;;;;;
; Exercice 16 ;
;;;;;;;;;;;;;;;

(define nb-annees-bissextiles
  (lambda (annee)
    (if (= 1900 annee) 
        0
        (if (bissextile? annee)
            (+ 1 (nb-annees-bissextiles (- annee 1)))
            (nb-annees-bissextiles (- annee 1))))))

(nb-annees-bissextiles 1999) ; 24
(nb-annees-bissextiles 2001) ; 25

;;;;;;;;;;;;;;;
; Exercice 17 ;
;;;;;;;;;;;;;;;
(define nb-jours-au-1-jan
  (lambda (mois)
    (cond 
      ((= 1 mois) 0)
      ((= 2 mois) 31)
      ((= 3 mois) (+ 31 28))
      ((= 4 mois) (+ 31 28 31))
      ((= 5 mois) (+ 31 28 31 30))
      ((= 6 mois) (+ 31 28 31 30 31))
      ((= 7 mois) (+ 31 28 31 30 31 30))
      ((= 8 mois) (+ 31 28 31 30 31 30 31))
      ((= 9 mois) (+ 31 28 31 30 31 30 31 31))
      ((= 10 mois) (+ 31 28 31 30 31 30 31 31 30))
      ((= 11 mois) (+ 31 28 31 30 31 30 31 31 30 31))
      ((= 12 mois) (+ 31 28 31 30 31 30 31 31 30 31 30))
      (else (display "Erreur")))))

;;;;;;;;;;;;;;;
; Exercice 18 ;
;;;;;;;;;;;;;;;

(define nb-jours
  (lambda (jour mois annee)
    (+ (* (- annee 1900) 365) 
       (nb-annees-bissextiles annee) 
       (nb-jours-au-1-jan mois) 
       (- jour 1)
       (if (and (bissextile? annee) (< mois 3)) -1 0))))

(nb-jours 05 01 1900) ;4

;;;;;;;;;;;;;;;
; Exercice 19 ;
;;;;;;;;;;;;;;;

(define jour-de-semaine
  (lambda (jour mois annee)
    (let ((n (modulo (nb-jours jour mois annee) 7)))
      (cond 
        ((= 0 n) (display "Lundi"))
        ((= 1 n) (display "Mardi"))
        ((= 2 n) (display "Mercredi"))
        ((= 3 n) (display "Jeudi"))
        ((= 4 n) (display "Vendredi"))
        ((= 5 n) (display "Samedi"))
        ((= 6 n) (display "Dimanche"))))))

(jour-de-semaine 30 09 2008)


;;;;;;;;;;;;;;;
; Exercice 20 ;
;;;;;;;;;;;;;;;

(define r 10)
;(define pi 3.141592)
(define volume-sphere 
  (lambda (r)
    (* (/ 4 3) pi r r)))
(volume-sphere r) ; 418.8789333333333
(define r2 4)
(volume-sphere r) ; 67.02062933333333

(define h2 10)
(define volume-cylindre
  (lambda (r h)
    (* pi r r h)))

(volume-cylindre r h) ; 502.65472

;;;;;;;;;;;;;;;
; Exercice 21 ;
;;;;;;;;;;;;;;;
(define c 300000)
(define einstein
  (lambda (u v)
    (/ (+ u v) (+ 1 (/ (* u v) (* c c))))))