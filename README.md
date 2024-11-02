NAME
====

Acme::Rautavistic::Sort - Rautavistic sort functions

SYNOPSIS
========

```raku
use Acme::Rautavistic::Sort;

# default alphanumeric comparison
@res = dropsort( <3 2 3 1 5> );      # 3 3 5
@res = dropsort( <cc bb dd aa ee> ); # cc dd ee

# force numeric comparison (or other comparators)
@res = dropsortx { $^a <=> $^b }, 1, 11, 2;
```

DESCRIPTION
===========

Acme::Rautavistic::Sort provides rautavistic sort functions. For more description of the functions see below.

dropsort
--------

From [https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html](https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html):

Dropsort is a fast, one-pass sorting algorithm suitable for many applications.

Algorithm Description Dropsort is run on an ordered list of numbers by examining the numbers in sequence, beginning with the second number in the list. If the number being examined is less than the number before it, drop it from the list. Otherwise, it is in sorted order, so keep it. Then move to the next number.

After a single pass of this algorithm, the list will only contain numbers that are at least as large as the previous number in the list. In other words, the list will be sorted! Analysis Dropsort requires exactly n-1 comparisons to sort a list of length n, making this an O(n) algorithm, superior to the typical O(n logn) algorithms commonly used in most applications.

Dropsort is what is known in the computer science field as a lossy algorithm. It produces a fast result that is correct, but at the cost of potentially losing some of the input data. Although to those not versed in the arts of computer science this may seem undesirable, lossy algorithms are actually a well-accepted part of computing. An example is the popular JPEG image compression format, which enjoys widespread use because of its versatility and usefulness. In similar fashion, dropsort promises to revolutionise the sorting of data in fields as diverse as commercial finance, government record-keeping, and space exploration.

FUNCTIONS
=========

dropsort
--------

Drop sort an array:

```raku
@SORTED = dropsort @VALUES
```

Values are compared using smart comparison (i.e., `cmp`). Use dropsortx to specify alternate comparators.

dropsortx
---------

Like dropsort but additionally takes a comparator:

```raku
@SORTED = dropsortx { $^a <=> $^b } @VALUES
```

Use the magic variables **$^a** and **$^b** for the comparison of two values.

Please note, that due to the nature of the algorithm, just reversing `$^a` and `$^b` does not just reverse the result list.

AUTHOR
======

Steffen Schwigon <ss5@renormalist.net>

ACKNOWLEDGEMENTS
================

Felix Antonius Wilhelm Ostmann (benchmark, optimization and stunt coordinator)

MORE INFO
=========

For more information about rautavistic sort and rautavistic in general see

  * [https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html](https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html)

  * [http://www.rautavistik.de](http://www.rautavistik.de) (in german)

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Steffen Schwigon

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

