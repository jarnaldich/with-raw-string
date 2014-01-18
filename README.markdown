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

Just clone the repo in your user collects dir. In case you don't know
where it is, eval this:

```
(require setup/dirs)
(find-user-collects-dir)
```
