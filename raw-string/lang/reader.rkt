(module reader syntax/module-reader
  #:language read 
  #:wrapper2 (lambda (in rd)
               (parameterize ([current-readtable 
                               (make-raw-str-readtable (read in))])
                 (rd in)))
  
  (require syntax/readerr
           (prefix-in raw: "reader_extension.rkt"))
    
  (define readtable-hook
    (case-lambda
      [(ch in)
       (raw:read in)]
      [(ch in src line col pos)
       (raw:read-syntax src in)]))
  
  (define (make-raw-str-readtable c)
    (make-readtable (current-readtable)
                    c 'terminating-macro readtable-hook)))
