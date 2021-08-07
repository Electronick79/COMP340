#lang racket
;load library to draw objects
(require 2htdp/image)

;drawing whitebox
(define (whitebox)(rectangle 80 80 "solid" "white"))
;drawing transparent box
(define (transpbox)(rectangle 80 80 0 "white"))
;set up pen with desired color and desired width
(define (pensetup pencolor penwidth)(pen pencolor penwidth "solid" "round" "round"))


#reader(lib "htdp-advanced-reader.ss" "lang")((modname tictactoe) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(require 2htdp/image)

(require 2htdp/universe)

;; Tic Tac Toe

; Tic Tac Toe


(define hard "hard")

(define medium "medium")

(define easy "easy")

(define difficulty easy)

(define E (rectangle 25 30 "solid" "white"))

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

;;============================

;; Data Definitions

;; Position is Natural [0,8]

;; interp. the playable position on a board

(define P1 0)

(define P2 6)

(define P3 8)

(define (fn-for-pos p)

(... p))

;; Val is Image

;; interp. Val is the value for a position on a board.

;; Either the position is empty(0), or held by player 1 or player 2.

;; interp. Image is one of:

;; - E

;; - X

;; - O

(define (fn-for-val v)

(cond[(image=? E) (...)]

[(image=? X) (...)]

[(image=? O) (...)]))

;; Board is ListOfVal

;; interp. The board is visually a 3x3 grid, consisting of X's and O's for a players move, E is a position not yet played.

;; The board is represented as a single flat list consisting of 9 values.

(define (fn-for-board lov)

(cond [(empty? lov) (...)]

[else

(... (fn-for-val (first lov))

(fn-for-board (rest lov)))]))

(define-struct unit (pos1 pos2 pos3))

;; Unit is (make-unit Position Position Position)

;; interp. the positions that make for a wining row, column or diagonal.

(define UNIT1 (make-unit 0 1 2))

(define UNIT2 (make-unit 3 4 5))

(define (fn-for-unit u)

(... (unit-pos1 u)

(unit-pos2 u)

(unit-pos3 u)))

(define B1

; E E E

; E E E

; E E E

(list E E E E E E E E E))

(define B2

; X E E

; E E E

; E E E

(list X E E E E E E E E))

(define B3

; X O E

; E E E

; E E X

(list X O E E E E E E X))

(define B4

; X O E

; E O E

; E E X

(list X O E E O E E E X))

(define B5

; X O E

; E O E

; X E X

(list X O E E O E X E X))

(define B6

; X O E

; E O E

; X O X

(list X O E E O E X O X))

(define B7

; X O X

; O X E

; O X O

(list X O X O X E O X O))

(define POSITION

; 0 1 2

; 3 4 5

; 6 7 8

(list 0 1 2 3 4 5 6 7 8))

;; There are a total of 8 possible winning rows, columns or diagonals.

(define UNITS

(list (make-unit 0 1 2)

(make-unit 3 4 5)

(make-unit 6 7 8)

(make-unit 0 3 6)

(make-unit 1 4 7)

(make-unit 2 5 8)

(make-unit 0 4 8)

(make-unit 2 4 6)))

;;================================================

;; Functions

;; -> Board

;; start the game with any of the following: (main easy)

;; (main medium)

;; (main hard)

;; **spacebar resets the board before the game is over

(define (main diff)

(begin (set! difficulty diff)

(big-bang B1

(on-mouse handle-mouse)

(to-draw render-board)

(on-key key-handler)

(stop-when game-over? last-scene))))

;; Board ->

;; produces the last scene with outcome printed on screen

(check-expect (last-scene (list X X X E E E E E E)) (overlay (text "You-Win" 20 "blue")

(render-board (list X X X E E E E E E))))

(check-expect (last-scene (list X X O E E O E E O)) (overlay (text "You-Lose" 20 "red")

(render-board (list X X O E E O E E O))))

(check-expect (last-scene (list X X O O O X X O O)) (overlay (text "Stale-mate" 20 "indigo")

(render-board (list X X O O O X X O O))))

(define (last-scene bd)

(local[(define (last-scene-X lou)

(cond[(empty? lou) (last-scene-O UNITS)]

[(x-over? bd (first lou)) (overlay (text "You-Win" 20 "blue") (render-board bd))]

[else

(last-scene-X (rest lou))]))

(define (last-scene-O lou)

(cond[(empty? lou) (overlay (text "Stale-mate" 20 "indigo") (render-board bd))]

[(o-over? bd (first lou)) (overlay (text "You-Lose" 20 "red") (render-board bd))]

[else

(last-scene-O (rest lou))]))]

(last-scene-X UNITS)))

;;=======================================================

;; Next Board

;; Board -> Board
;(check-expect(next-board (list X E E E E E E E X))(list X O E E E E E E X)) ;only easy is tested, since global defn.

;(check-expect(next-board (list X X E E E E E E E))(list X X O E E E E E E))

(define (next-board bd)

(cond[(string=? difficulty "hard")

(cond[(for-the-win bd) (take-the-win bd)]

[(block? bd) (next-block bd)]

[(win? bd) (next-win bd)]

[else

(next-move bd)])]

[(string=? difficulty "medium")

(if (block? bd)

(next-block bd)

(next-move bd))]

[else

(next-move bd)]))

;; Board -> Boolean

;; produce true if player-2 can win with next move, else false.

(check-expect (for-the-win (list X O E E O E E E E)) true)

(check-expect (for-the-win (list X O E E E E E E E)) false)

(define (for-the-win bd)

(list? (take-the-win bd)))

;; Board -> Board

;; produce the next board that wins the game for player-2 AI

(check-expect (take-the-win (list X O E E O E E E E)) (list X O E E O E E O E))

(check-expect (take-the-win (list X O E X O E E E E)) (list X O E X O E E O E))

(check-expect (take-the-win (list X O E X E E E E E)) false)

(define (take-the-win bd)

(local[(define (check-for-winning-unit lou)

(cond [(empty? lou) false]

[else

(if (unit-win? bd (first lou))

(steal-position bd (first lou))

(check-for-winning-unit (rest lou)))]))]

(check-for-winning-unit UNITS)))

;; Board Unit -> Boolean

;; produces true if the number of X's in a unit is equal to 2, false otherwise

(check-expect (unit-win? (list O O E E E E E E O) (make-unit 0 4 8)) true)

(check-expect (unit-win? (list X O E E O E E E X) (make-unit 0 4 8)) false)

(define (unit-win? bd u)

(= (count-O bd u) 2))

;; Board -> Boolean

;; produce true if a block can be made, else false.

(check-expect (block? B3) true)

(check-expect (block? B4) false)

(define (block? bd)

(list? (next-block bd)))

;; if true, AI takes the 3rd position.

;; otherwise produce false.

(check-expect (next-block B3) (list X O E E O E E E X))

(check-expect (next-block B2) false)

(define (next-block bd)

(local[(define (check-for-blocks lou)

(cond [(empty? lou) false]

[else

(if (unit-block? bd (first lou))

(steal-position bd (first lou))

(check-for-blocks (rest lou)))]))]

(check-for-blocks UNITS)))

;; Board Unit -> Boolean

;; produces true if the number of X's in a unit is equal to 2, false otherwise

(check-expect (unit-block? (list X O E E E E E E X) (make-unit 0 4 8)) true)

(check-expect (unit-block? (list X O E E O E E E X) (make-unit 0 4 8)) false)

(define (unit-block? bd u)

(= (count-X bd u) 2))

;; Board Unit -> Natural

;; Produces the number of player-1's X's in a unit

(check-expect (count-X (list X O E E E E E E X) (make-unit 0 4 8)) 2) ; can block

(check-expect (count-X (list X O E E O E E E X) (make-unit 0 4 8)) 1) ; already blocked

(check-expect (count-X (list X O E E E E E E E) (make-unit 0 4 8)) 1) ; no blocking

(define (count-X bd u)

(local [(define acc 0)]

(begin

(if (image=? (list-ref bd (unit-pos1 u)) X)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos1 u)) O)

(set! acc (- acc 1))

acc))

(if (image=? (list-ref bd (unit-pos2 u)) X)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos2 u)) O)

(set! acc (- acc 1))

acc))

(if (image=? (list-ref bd (unit-pos3 u)) X)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos3 u)) O)

(set! acc (- acc 1))

acc))

acc)))

;; Board Unit -> Board

;; Produce New Board with O at position already determined to be blocked

(check-expect (steal-position (list X O E E E E E E X) (make-unit 0 4 8)) (list X O E E O E E E X))

(define (steal-position bd u)

(cond[(image=? (list-ref bd (unit-pos1 u)) E) (fill-board bd (unit-pos1 u) O)]

[(image=? (list-ref bd (unit-pos2 u)) E) (fill-board bd (unit-pos2 u) O)]

[(image=? (list-ref bd (unit-pos3 u)) E) (fill-board bd (unit-pos3 u) O)]))

;; Board -> Boolean

;; produce true if the game can be won, else false.

(check-expect (win? B7) false)

(check-expect (win? B6) true)

(check-expect (win? B1) true)

(define (win? bd)

(list? (next-win bd)))

;; Board -> Board or false

(check-expect (next-win (list X E E E E E E E E)) (list X E E O E E E E E))

(check-expect (next-win (list O E E E E E E E E)) (list O O E E E E E E E))

(check-expect (next-win (list O O E E E E E E E)) (list O O O E E E E E E))

(check-expect (next-win (list X X X X X X X X E)) false)

(define (next-win bd)

(local[(define (check-for-win lou)

(cond [(empty? lou) false]

[else

(if (next-win? bd (first lou))

(cond[(not (image=? (list-ref bd (unit-pos1 (first lou))) O))

(fill-board bd (unit-pos1 (first lou)) O)]

[(not (image=? (list-ref bd (unit-pos2 (first lou))) O))

(fill-board bd (unit-pos2 (first lou)) O)]

[else

(fill-board bd (unit-pos3 (first lou)) O)])

(check-for-win (rest lou)))]))]

(check-for-win UNITS)))

;; Board -> Boolean

;; produce true if no value in a unit belongs to player-1, no x's

(check-expect (next-win? (list X O E E E E E E X) (make-unit 0 4 8)) false)

(check-expect (next-win? (list E O E E E E E E E) (make-unit 0 4 8)) true)

(check-expect (next-win? (list O O E E E E E E E) (make-unit 0 4 8)) true)

(define (next-win? bd u)

(and (not (image=? (list-ref bd (unit-pos1 u)) X))

(not (image=? (list-ref bd (unit-pos2 u)) X))

(not (image=? (list-ref bd (unit-pos3 u)) X))))

;; Board -> Board

;; produce player-2's next move

;(check-expect (next-move (list X E E E E E E E E)) (list X O E E E E E E E))

#;

(define (next-move bd)

(local [(define (next-move bd original)

(cond[(empty? bd) bd]

[(image=? (first bd) E) (fill-board original (- (length original) (length bd)) O)]

[else

(next-move (rest bd) original)]))]

(next-move bd bd)))

;; given the random element, a check-expect is not possible

;; i would prefer the list of boards would diminish after each loop, but

;; the termination argument is that it will eventually find an empty position

(define (next-move bd)

(local [(define r-pos (random (length bd)))]

(if (image=? (list-ref bd r-pos) E)

(fill-board bd r-pos O)

(next-move bd))))

;; Board Pos Val -> Board

;; produce new board with val at given position

(check-expect (fill-board (list X O E E E E E E X) 4 O) (list X O E E O E E E X))

(define (fill-board bd p nv)

(cond [(zero? p) (cons nv (rest bd))]

[else

(cons (first bd) (fill-board (rest bd) (sub1 p) nv))]))

;; (listof X) Pos ->(listof X)

;; produce new list, minus one value at position pos

(check-expect (drop (list X O E E E E E E X) 4) (list X O E E E E E X))

(define (drop bd p )

(cond [(zero? p) (rest bd)]

[else

(cons (first bd) (drop (rest bd) (sub1 p)))]))

;;================================================

;; Big Bang events

;; Board -> Image

;; Interpret the EXO's and produce an image

(check-expect (render-board B1))

(define (render-board bd)

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(overlay/xy

(list-ref bd 0)

40 0 (list-ref bd 1))

80 0 (list-ref bd 2))

0 35 (list-ref bd 3))

40 35 (list-ref bd 4))

80 35 (list-ref bd 5))

0 70 (list-ref bd 6))

40 70 (list-ref bd 7))

80 70 (list-ref bd 8))

0 0 MTS))



;; Board Unit -> Boolean

;; produces true if 3 X's in one unit

(check-expect (x-over? (list X O E E X E E E X) (make-unit 0 4 8)) true)

(check-expect (x-over? (list X O E E X E E E O) (make-unit 0 4 8)) false)

(define (x-over? bd u)

(= (count-X bd u) 3))

;; Board Unit -> Boolean

;; produces true if 3 O's in one unit

(check-expect (o-over? (list X O E E O E E O X) (make-unit 1 4 7)) true)

(check-expect (o-over? (list X O E E X E E E O) (make-unit 0 4 8)) false)

(define (o-over? bd u)

(= (count-O bd u) 3))

;; Board -> Number

;; produce the number of O's in a unit

(check-expect (count-O (list X O E E E E E E E) (make-unit 0 4 8)) -1)

(check-expect (count-O (list X O E E E E E E E) (make-unit 1 4 7)) 1)

(check-expect (count-O (list X O E E E E E O E) (make-unit 1 4 7)) 2)

(check-expect (count-O (list X O E E X E E O E) (make-unit 1 4 7)) 1)

(define (count-O bd u)

(local [(define acc 0)]

(begin

(if (image=? (list-ref bd (unit-pos1 u)) O)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos1 u)) X)

(set! acc (- acc 1))

acc))

(if (image=? (list-ref bd (unit-pos2 u)) O)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos2 u)) X)

(set! acc (- acc 1))

acc))

(if (image=? (list-ref bd (unit-pos3 u)) O)

(set! acc (+ acc 1))

(if (image=? (list-ref bd (unit-pos3 u)) X)

(set! acc (- acc 1))

acc))

acc)))

;; Board KeyEvent -> Board

(check-expect (key-handler (list X O E E E E E E E) "up") (list X O E E E E E E E))

(check-expect (key-handler (list X O E E E E E E E) " ") (list E E E E E E E E E))

(define (key-handler bd key))

(cond [(key=? " " key) B1]

[else bd])