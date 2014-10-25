package Metabase::Fact::Hash;
use 5.006;
use strict;
use warnings;
our $VERSION = '0.005';
$VERSION = eval $VERSION;

use base 'Metabase::Fact';
use JSON ();
use Carp ();


sub _dlength { defined( $_[0] ) && length( $_[0] ) }

sub validate_content {
  my ($self) = @_;
  my $content = $self->content;
  my $class = ref $self;
  Carp::confess "content must be a hashref"
    unless ref $content eq 'HASH';
  my $get_req =$self->can('required_keys') || sub { () }; 
  my $get_opt =$self->can('optional_keys') || sub { () }; 
  # find missing
  my @missing =  grep { ! _dlength( $content->{$_} ) } $get_req->();
  Carp::croak "missing required keys for $class\: @missing\n" if @missing;
  # check for invalid
  my %valid = map { $_ => 1 } ($get_req->(), $get_opt->());
  my @invalid = grep { ! exists $valid{$_} } keys %$content;
  Carp::croak "invalid keys for $class\: @invalid\n" if @invalid;
  return 1;
}

sub content_as_bytes {
  my ($self) = @_;
  return JSON->new->encode($self->content);
}

sub content_from_bytes { 
  my ($class, $bytes) = @_;
  return JSON->new->decode($bytes);
}

1;

__END__

=head1 NAME

Metabase::Fact::Hash - fact subtype for simple hashes

=head1 SYNOPSIS

  # defining the fact class
  package MyComment;
  use base 'Metabase::Fact::Hash';

  sub required_keys { qw/poster/ }

  sub optional_keys { qw/comment/ }

  sub content_metadata {
    my $self = shift;
    return {
      poster => [ '//str' => $self->content->{poster} ],
    };
  }

  sub validate_content {
    my $self = shift;
    $self->SUPER::validate_content; # required and optional keys

    # other analysis of values
  }

...and then...

  # using the fact class
  my $fact = MyFact->new(
    resource => 'RJBS/Metabase-Fact-0.001.tar.gz',
    content => {
      poster  => 'larry',
      comment => 'Metabase rocks!',
    }
  );

  $client->send_fact($fact);

=head1 DESCRIPTION

Many (if not most) facts to be stored in a Metabase are just hashes of simple
data.  Metabase::Fact::Hash is a subclass of L<Metabase::Fact|Metabase::Fact>
with most of the required Fact methods already implemented.  If you write your
class as a subclass of Metabase::Fact::Hash, you can store simple hashes in it.

You may wish to implement a C<content_metadata> method to generate metadata
about the hash contents.

You should also implement a C<validate_content> method to validate the
structure of the hash you're given.

=head1 ATTRIBUTES

=head2 Arguments provided to new

=head3 resource

B<required>

The canonical resource (URI) the Fact relates to.  For CPAN distributions, this
would be a C<cpan:///distfile/> URL.  (See L<URI::cpan>.)

=head3 content

B<required>

A reference to the actual information associated with the fact.
The exact form of the content is up to each Fact class to determine.

=head1 METHODS

For information on the methods provided by this class, see
L<Metabase::Fact|Metabase::Fact>.

=head1 BUGS

Please report any bugs or feature using the CPAN Request Tracker.  
Bugs can be submitted through the web interface at 
L<http://rt.cpan.org/Dist/Display.html?Queue=Metabase-Fact>

When submitting a bug or request, please include a test file or a patch to an
existing test-file that illustrates the bug or desired feature.

=head1 AUTHOR

=over 

=item * David A. Golden (DAGOLDEN)

=item * Ricardo J. B. Signes (RJBS)

=back

=head1 COPYRIGHT AND LICENSE

 Portions copyright (c) 2008-2009 by David A. Golden
 Portions copyright (c) 2008-2009 by Ricardo J. B. Signes

Licensed under the same terms as Perl itself (the "License").
You may not use this file except in compliance with the License.
A copy of the License was distributed with this file or you may obtain a 
copy of the License from http://dev.perl.org/licenses/

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut
