

#lang racket

#reader(lib "htdp-advanced-reader.ss" "lang")((modname tictactoe) (read-case-sensitive #t) (teachpacks ())
                                                                  (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;load library to draw objects
(require 2htdp/image)

;drawing whitebox
(define (whitebox)(rectangle 80 80 "solid" "white"))
;drawing transparent box
(define (transpbox)(rectangle 80 80 0 "white"))
;set up pen with desired color and desired width
(define (pensetup pencolor penwidth)(pen pencolor penwidth "solid" "round" "round"))


( define(pensetup "red" 3))
(define(pensetup "black" 5))
(circle 20 “outline” (pensetup “red” 3))
(define (omark) (overlay (singlecircle)(whitebox)))


(define E (rectangle 30 30 "solid" "white"))

(define X (text "X" 30 "blue"))

(define O (text "O" 30 "red"))

(define P (rectangle 30 30 "solid" "white")) ; Empty Position

(define H (rectangle 30 5 "solid" "black")) ; Horizontal Divider

(define V (rectangle 5 30 "solid" "black")) ; Vertical Divider

(define g (rectangle 5 5 "solid" "black")) ; Gap

(define MTS (above

(beside P V P V P)

(beside H g H g H)

(beside P V P V P)

(beside H g H g H)

(beside P V P V P)))
(define (verline))
(define (horigrid (90 <image>))) 
(define (tictactoe) (overlay (grid) (wholeboard)))


;Define a function vertline that overlays vline on top of transpbox. Since vertline
;will be overlayed on top of wholeboard, if you use whitebox instead of transpbox, some
;part of wholeboard will not be visible later.
;3. Define a function vertgrid that arranges two vertlines horizontally. You can use beside

(define (horizontal-line x)
  (line x 1 "black"))

(define (vertical-line x)
  (line 1 x "black"))

(define (add-left-border height design color image)
  (overlay/align "left" "top"
                 (vertical-line height)
                 image))

(define (add-right-border height design color image)
  (overlay/align "right" "top"
                 (vertical-line height)
                 image))

(add-left-border 80 "solid" "red"
                 (add-right-border 200 "solid" "red"
                                   (circle 0 "solid" "red")))


(define (fn-for-val v)

(cond[(image=? E) (...)]

[(image=? X) (...)]

[(image=? O) (...)]))

Input: board[] =  {'X', 'X', 'O', 
                   'O', 'O', 'X',
                   'X', 'O', 'X'};
Output: Valid

Input: board[] =  {'O', 'X', 'X', 
                   'O', 'X', 'X',
                   'O', 'O', 'X'};
Output: Invalid
(Both X and O cannot win)

Input: board[] =  {'O', 'X', ' ', 
                   ' ', ' ', ' ',
                   ' ', ' ', ' '};













