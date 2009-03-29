use strict;
use warnings;
use ExtUtils::MakeMaker;

# Eventually use Devel::CheckLib
exit if $ENV{AUTOMATED_TESTING};

my $libs = join ' ', grep { defined } @ENV{qw(LDFLAGS LD_LIBRARY_PATH)};
my $inc  = join ' ', grep { defined } @ENV{qw(CFLAGS CXXFLAGS CPPFLAGS)};

WriteMakefile(
    NAME          => 'Tree::Suffix',
    AUTHOR        => 'gray <gray@cpan.org>',
    LICENSE       => 'perl',
    VERSION_FROM  => 'lib/Tree/Suffix.pm',
    ABSTRACT_FROM => 'lib/Tree/Suffix.pm',
    PREREQ_PM     => { 'Test::More' => 0 },
    LIBS          => [ "$libs -lstree" ],
    INC           => $inc,
    dist          => { COMPRESS => 'gzip -9f', SUFFIX => '.gz', },
    clean         => { FILES => 'Tree-Suffix-*' },
);
