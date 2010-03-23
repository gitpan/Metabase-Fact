# 
# This file is part of Metabase-Fact
# 
# This software is Copyright (c) 2010 by David Golden.
# 
# This is free software, licensed under:
# 
#   The Apache License, Version 2.0, January 2004
# 
package FactSubClasses;
our $VERSION = '0.008';
use strict;
use warnings;

use Metabase::Fact::String;
use Metabase::Fact::Hash;

package FactOne;
our $VERSION = '0.008';
our @ISA = ('Metabase::Fact::String');
sub content_as_bytes    { return reverse($_[0]->{content})  };
sub content_from_bytes  { return reverse($_[1])             };

package FactTwo;
our $VERSION = '0.008';
our @ISA = ('Metabase::Fact::String');
sub content_as_bytes    { return reverse($_[0]->{content})  };
sub content_from_bytes  { return reverse($_[1])             };

package FactThree;
our $VERSION = '0.008';
use base 'Metabase::Fact::String';
sub validate_content    { 
  $_[0]->SUPER::validate_content;
  die "content not positive length" unless length $_[0]->content > 0;
}
sub content_metadata    { 
  return { 'length' => [ '//num' => length $_[0]->content ] } 
}

package FactFour;
our $VERSION = '0.008';
use base 'Metabase::Fact::Hash';
sub required_keys {qw/ first /};
sub optional_keys {qw/ second /};
sub content_metadata    { 
  return { 'size' => [ '//num' => scalar keys %{ $_[0]->content } ] } 
}


1;
