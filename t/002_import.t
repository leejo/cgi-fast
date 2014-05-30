#!perl -w

my $fcgi;
BEGIN {
    local $@;
    eval { require FCGI };
    $fcgi = $@ ? 0 : 1;
}

use Test::More tests => 2;

# Shut up "used only once" warnings.
() = $CGI::Q;

SKIP: {
    skip( 'FCGI not installed, cannot continue', 2 ) unless $fcgi;

    use CGI::Fast
        socket_path  => ':9000',
        listen_queue => 50
    ;

    is( $CGI::Fast::socket,':9000','imported socket_path' );
    is( $CGI::Fast::queue,50,'imported listen_queue' );
};
