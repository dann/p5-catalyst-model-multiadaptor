package Catalyst::Model::MultiAdaptor;
use strict;
use warnings;
use Class::C3;

our $VERSION = '0.01';
use base 'Catalyst::Model::MultiAdaptor::Base';

sub new {
    my $class = shift;
    my $self  = $class->next::method(@_);
    $self->load_services( $self->{config} );
    $self;
}

1;

__END__

=head1 NAME

Catalyst::Model::MultiAdaptor - use plain classes as a Catalyst Model

=head1 SYNOPSIS

Given a good old perl class like:

  package MyApp::Service::SomeClass;
  use Moose;

  has 'id' => (
      is => 'rw', 
  );

  1;


  package MyApp::Service::AnotherClass;
  use Moose;

  has 'host' => (
      is => 'rw', 
  );

  1;


Wrap them with a Catalyst Model.

  use Catalyst::Model::MultiAdaptor;

  package MyApp::Web::Model::Service;
  use base 'Catalyst::Model::MultiAdaptor';
  __PACKAGE__->config( 
      package => 'MyApp::Service',
      config => {
          'SomeClass' => {
              id => 1,
          },
          'AnotherClass' => {
                host => 'example',
          },
  );

  1;

Note that C<MyApp::Service::SomeClass> is instantiated at application
statup time.

=head1 DESCRIPTION

This modules aims to integrate POPO models into Catalyst model.

Application models should be plain old perl class (POPO).
Separating model classes from Catalyst makes Model classes more 
resusable and testable.

Catalyst::Model::Adaptor is very good module for this purpose.
but we need to create multiple adaptors if we have multiple 
plain perl classes.

This modules can easily integrate multiple plain models as 
Catalyst model.

=head1 AUTHOR

dann E<lt>techmemo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
