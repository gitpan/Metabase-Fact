# 
# This file is part of Metabase-Fact
# 
# This software is Copyright (c) 2010 by David Golden.
# 
# This is free software, licensed under:
# 
#   The Apache License, Version 2.0, January 2004
# 
use strict;
use warnings;

package JustOneFact;
our $VERSION = '0.008';
our @ISA = ('Metabase::Report');
sub report_spec { return {'Metabase::Fact' => 1} }

package OneOrMoreFacts;
our $VERSION = '0.008';
our @ISA = ('Metabase::Report');
sub report_spec { return {'Metabase::Fact' => '1+'} }

package OneOfEach;
our $VERSION = '0.008';
our @ISA = ('Metabase::Report');
sub report_spec { 
  return {
    'FactOne' => '1',
    'FactTwo' => '1',
  }
}

package OneSpecificAtLeastThreeTotal;
our $VERSION = '0.008';
our @ISA = ('Metabase::Report');
sub report_spec { 
  return {
    'FactOne' => '1',
    'Metabase::Fact' => '3',
  }
}

1;
