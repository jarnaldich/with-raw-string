# `racket-raw-string` #

This is a modified version of
[`with-raw-string`](https://github.com/jarnaldich/with-raw-string) library
written by [@jarnaldich](https://github.com/jarnaldich).

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

## License ##

This library is distributed under the terms of the GNU General Public License
v3.0 (GPLv3).  See [`COPYING`](/COPYING) for further information.

Copyright 2014 (C)  Duong Nguyen ([@cmpitg](https://github.com/cmpitg))
Copyright 2011 (C)  Joan Arnaldich ([@jarnaldich](https://github.com/jarnaldich))

