package Catalyst::Model::MultiAdaptor;
use strict;
use warnings;
use Class::C3;

our $VERSION = '0.01';
use base 'Catalyst::Model::MultiAdaptor::Base';

sub new {
    my $class = shift;
    my $self  = $class->next::method(@_);
    $self->load_services;
    $self;
}

1;

__END__

=head1 NAME

Catalyst::Model::MultiAdaptor -

=head1 SYNOPSIS

  use Catalyst::Model::MultiAdaptor;

=head1 DESCRIPTION

Catalyst::Model::Loader is

=head1 AUTHOR

dann E<lt>techmemo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
