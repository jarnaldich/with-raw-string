;;
;; This file is part of racket-raw-string project.
;;
;; Copyright (C) 2014  Duong Nguyen (@cmpitg)
;; Copyright (C) 2011  Joan Arnaldich (@jarnaldich)
;; 
;; racket-raw-string is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by the
;; Free Software Foundation, either version 3 of the License, or (at your
;; option) any later version.
;; 
;; racket-raw-string is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;; 
;; You should have received a copy of the GNU General Public License along
;; with racket-raw-string.  If not, see <http://www.gnu.org/licenses/>.
;;

#lang racket

(require syntax/readerr)

(provide read
         read-syntax)

(define (read in)
  (syntax->datum (read-syntax #f in)))

(define (read-syntax src in)
  
  (define opening-char (read-char in))
  (define closing-str (case opening-char
                        [(#\() "\\)"]
                        [(#\[) "\\]"]
                        [(#\{) "\\}"]
                        [else (string opening-char)]))
  
  (define regex (pregexp (string-append "^.*?" closing-str)))
  
  (define-values (line col pos) (port-next-location in))
  
  (define raw-str (regexp-match regex in))
  
  (unless raw-str 
    (raise-read-error "bad raw string syntax"
                      src line col pos
                      (- (file-position in) pos)))
  
  (define (strip-last-char s)
    (substring s 0 (- (string-length s) 1)))

  (define (to-syntax v)
    (datum->syntax #f ; lexical context read-syntax should have no lexical context
                   v  ; Value
                   (vector src          ; File, normally syntax-source
                           line         ; line
                           col          ; column
                           pos          ; character since beginning of source
                           (string-length v) ; the span (width)
                           )))               ; check location info
  
  (to-syntax (strip-last-char (bytes->string/locale (car raw-str)))))
