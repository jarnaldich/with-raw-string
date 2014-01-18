# `racket-raw-string` #

This is a modified version of
[`with-raw-string`](https://github.com/jarnaldich/with-raw-string) library
written by [jarnaldich](https://github.com/jarnaldich).

This is an extension language on top of Racket that tunes the reader to add
raw string syntax, so that you can write things like:

```racket
#lang raw-string racket #\$

(directory-list $"\\SERVER\Share")          ; list unc paths under windows
(directory-list $[c:\Program Files] )       ; use paring chars as delimiters
(regexp-split (pregexp $'\s') "two fields") ; -> '("two" "fields")
```

## Installation ##

To install Rackjure with Racket 5.3.4 and newer:

```sh
raco pkg install racket-raw-string
```

On older versions of Racket (either you'll need Git or download the tarball
and extract them manually):

```sh
git clone https://github.com/cmpitg/racket-raw-string.git
raco link racket-raw-string
raco setup racket-raw-string
```
