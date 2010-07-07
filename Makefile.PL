
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'base class for Metabase Facts',
  'AUTHOR' => 'David Golden <dagolden@cpan.org>, Ricardo Signes <rjbs@cpan.org>, H.Merijn Brand <hmbrand@cpan.org>',
  'BUILD_REQUIRES' => {
    'Cwd' => '0',
    'File::Find' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0.20',
    'Test::Exception' => '0',
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Metabase-Fact',
  'EXE_FILES' => [
    'bin/metabase-profile'
  ],
  'LICENSE' => 'apache',
  'NAME' => 'Metabase::Fact',
  'PREREQ_PM' => {
    'CPAN::DistnameInfo' => '0',
    'Carp' => '0',
    'Data::GUID' => '0',
    'Getopt::Long' => '0',
    'JSON' => '2',
    'Pod::Usage' => '0',
    'overload' => '0'
  },
  'VERSION' => '0.015',
  'test' => {
    'TESTS' => 't/*.t t/fact/*.t t/report/*.t t/resource/*.t t/user/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



