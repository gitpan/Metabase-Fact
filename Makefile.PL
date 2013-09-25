
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.17;



my %WriteMakefileArgs = (
  "ABSTRACT" => "base class for Metabase Facts",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>, Ricardo Signes <rjbs\@cpan.org>, H.Merijn Brand <hmbrand\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Metabase-Fact",
  "EXE_FILES" => [
    "bin/metabase-profile"
  ],
  "LICENSE" => "apache",
  "NAME" => "Metabase::Fact",
  "PREREQ_PM" => {
    "CPAN::DistnameInfo" => 0,
    "Carp" => 0,
    "Data::GUID" => 0,
    "Getopt::Long" => 0,
    "IO::Prompt::Tiny" => 0,
    "JSON" => 2,
    "Pod::Usage" => 0,
    "overload" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Cwd" => 0,
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "File::Spec::Functions" => 0,
    "File::Temp" => "0.20",
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "List::Util" => 0,
    "Test::Exception" => 0,
    "Test::More" => "0.88",
    "lib" => 0
  },
  "VERSION" => "0.023",
  "test" => {
    "TESTS" => "t/*.t t/fact/*.t t/report/*.t t/resource/*.t t/user/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



