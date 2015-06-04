#!/usr/bin/env perl

use strict;
use warnings;

# the order is important! (see GH #12)
use CGI::Fast;
use CGI qw/ :standard -no_xhtml -nosticky /;
use Test::More qw/ no_plan /;

my $q = CGI::Fast->new;

my $start_html = start_html();
unlike( $start_html,qr/XHTML/,'CGI pragma not overriden by CGI::Fast' );
