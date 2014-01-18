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

(module reader syntax/module-reader
  #:language read 
  #:wrapper2 (lambda (in rd)
               (parameterize ([current-readtable 
                               (make-raw-str-readtable (read in))])
                 (rd in)))
  
  (require syntax/readerr
           (prefix-in raw: "reader-extension.rkt"))
    
  (define readtable-hook
    (case-lambda
      [(ch in)
       (raw:read in)]
      [(ch in src line col pos)
       (raw:read-syntax src in)]))
  
  (define (make-raw-str-readtable c)
    (make-readtable (current-readtable)
                    c 'terminating-macro readtable-hook)))
