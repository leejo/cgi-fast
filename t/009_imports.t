#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use CGI::Fast qw/ :standard /;

my $cgi_version = $CGI::VERSION;

if ( ! $cgi_version ) {
	plan skip_all => "Couldn't figure out CGI version";
} else {
	$cgi_version =~ s/\.(\d+)\D.*$/.$1/;
}

if ( $cgi_version < 4.14 ) {
	plan skip_all => "CGI v4.14+ required for this test";
}

eval { cgi_error() };
ok( ! $@,'imports' );
$@ && diag( $@ );

done_testing();
