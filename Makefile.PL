
use strict;
use warnings;

 BEGIN { require 5.006; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t t/fact/*.t t/report/*.t t/resource/*.t t/user/*.t'
                                 },
                       'NAME' => 'Metabase::Fact',
                       'DISTNAME' => 'Metabase-Fact',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'David Golden <dagolden@cpan.org>, Ricardo Signes <rjbs@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'base class for Metabase Facts',
                       'EXE_FILES' => [
                                        'bin/metabase-profile'
                                      ],
                       'VERSION' => '0.009',
                       'PREREQ_PM' => {
                                        'Test::Exception' => '0',
                                        'File::Spec' => '3',
                                        'CPAN::DistnameInfo' => '0',
                                        'Carp' => '0',
                                        'Data::GUID' => '0',
                                        'Test::More' => '0.88',
                                        'File::Find' => '0',
                                        'File::Temp' => '0.20',
                                        'JSON' => '2',
                                        'Cwd' => '0'
                                      },
                       'LICENSE' => 'apache'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



