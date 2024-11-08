unit class Acme::Rautavistic::Sort;

sub dropsort is export {
    my $last;
    @_.map: {
        $last //= $_;

        defined($last) && !defined($_) ?? Empty !!
        ($_ cmp $last ~~ Same|More)    ?? ($last := $_) !!
        Empty
    };
}

=begin pod

=head1 NAME

Acme::Rautavistic::Sort - Rautavistic sort functions

=head1 SYNOPSIS

=begin code :lang<raku>

use Acme::Rautavistic::Sort;

# default alphanumeric comparison
@res = dropsort( <3 2 3 1 5> );      # <3 3 5>
@res = dropsort( <cc bb dd aa ee> ); # <cc dd ee>

=end code

=head1 DESCRIPTION

Acme::Rautavistic::Sort provides rautavistic sort functions. For more
description of the functions see below.

=head2 dropsort

From L<https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html>:

Dropsort is a fast, one-pass sorting algorithm suitable for many
applications.

Algorithm Description Dropsort is run on an ordered list of numbers by
examining the numbers in sequence, beginning with the second number in
the list. If the number being examined is less than the number before
it, drop it from the list. Otherwise, it is in sorted order, so keep
it. Then move to the next number.

After a single pass of this algorithm, the list will only contain
numbers that are at least as large as the previous number in the
list. In other words, the list will be sorted!  Analysis Dropsort
requires exactly n-1 comparisons to sort a list of length n, making
this an O(n) algorithm, superior to the typical O(n logn) algorithms
commonly used in most applications.

Dropsort is what is known in the computer science field as a lossy
algorithm. It produces a fast result that is correct, but at the cost
of potentially losing some of the input data. Although to those not
versed in the arts of computer science this may seem undesirable,
lossy algorithms are actually a well-accepted part of computing. An
example is the popular JPEG image compression format, which enjoys
widespread use because of its versatility and usefulness. In similar
fashion, dropsort promises to revolutionise the sorting of data in
fields as diverse as commercial finance, government record-keeping,
and space exploration.

=head1 FUNCTIONS

=head2 dropsort

Drop sort an array:

=begin code :lang<raku>

@SORTED = dropsort @VALUES

=end code

Values are compared using smart comparison (i.e., C<cmp> and C<~~>)
sensibly, to handle numbers and strings in the original DWIM way of
Perl when using allomorphs. Support for other types is not yet tested.

=head1 AUTHOR

Steffen Schwigon <ss5@renormalist.net>

=head1 ACKNOWLEDGEMENTS

Felix Antonius Wilhelm Ostmann (benchmark, optimization and stunt
coordinator in the original Perl version)

=head1 MORE INFO

For more information about rautavistic sort and rautavistic in general
see

=item L<https://web.archive.org/web/20240512074546/https://www.dangermouse.net/esoteric/dropsort.html>
=item L<http://www.rautavistik.de> (in german)

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Steffen Schwigon

This library is free software; you can redistribute it and/or modify
it under the Artistic License 2.0.

=end pod
