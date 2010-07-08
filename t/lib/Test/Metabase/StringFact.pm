# 
# This file is part of Metabase-Fact
# 
# This software is Copyright (c) 2010 by David Golden.
# 
# This is free software, licensed under:
# 
#   The Apache License, Version 2.0, January 2004
# 
package Test::Metabase::StringFact;
use 5.006;
use strict;
use warnings;
use Metabase::Fact::String;
our @ISA = qw/Metabase::Fact::String/;

sub content_metadata {
  my $self = shift;
  return {
    'size' => [ '//num' => length $self->content ],
  };
}

sub validate_content {
  my $self = shift;
  $self->SUPER::validate_content;
  die __PACKAGE__ . " content length must be greater than zero\n"
  if length $self->content < 0;
}

1;
