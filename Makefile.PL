use ExtUtils::MakeMaker;
my $mm = $ExtUtils::MakeMaker::VERSION;

require 5.008001;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
'INSTALLDIRS' => ( $] >= 5.012 ? 'site' : 'perl' ),
    'NAME'	=> 'CGI::Fast',
    'DISTNAME'  => 'CGI-Fast',
    'VERSION_FROM'   => 'lib/CGI/Fast.pm',
     'PREREQ_PM' => {
       'if'          => 0, # core in 5.6.2 and later, for deprecate.pm
       'Test::More'  => 0.98, # Ideally, this could be just a "test_requires". Version requirement is for 'subtest' support.
       'File::Spec'  => .82,
       'CGI'         => 3.65_02,
       'FCGI'        => 0.67,
    },
    test => { TESTS => 't/*.t' },
    'linkext'   => { LINKTYPE=>'' },	# no link needed
    'dist'      => {'COMPRESS'=>'gzip -9f', 'SUFFIX' => 'gz',
	            'ZIP'=>'/usr/bin/zip','ZIPFLAGS'=>'-rl'},
   (   $mm < 6.46
        ? ()
        : ( META_MERGE => {
                requires  => {perl => '5.008001'},
                resources => {
                    license    => 'http://dev.perl.org/licenses/',
                    homepage => 'https://metacpan.org/module/CGI::Fast',
                    repository => 'https://github.com/leejo/cgi-fast',
                    bugtracker => 'https://github.com/leejo/cgi-fast/issues',
                },
                no_index => {directory => [qw/t/]},
            },
            META_ADD => {
                build_requires     => {},
                configure_requires => {}
            },
        )
    ),


);

