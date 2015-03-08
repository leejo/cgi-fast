#!/usr/bin/env perl

use strict;
use warnings;

use CGI qw/ :standard -no_xhtml -nosticky /;
use CGI::Fast;
use Test::More qw/ no_plan /;

new CGI::Fast;

my $start_html = start_html();
unlike( $start_html,qr/XHTML/,'CGI pragma not overriden by CGI::Fast' );
