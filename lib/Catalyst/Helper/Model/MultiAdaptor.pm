package Catalyst::Helper::Model::MultiAdaptor;
use strict;
use warnings;

=head1 NAME

Catalyst::Helper::Model::MultiAdaptor - helper for 
Catalyst::Model::MultiAdaptor

=cut

sub mk_compclass {
    my ( $class, $helper, $package, $const ) = @_;
    my ($type) = ( $class =~ /^Catalyst::Helper::Model::(.+)$/ );
    die "i am nothing.  that doesn't make sense." unless $type;

    my %args = (
        package     => $package,
        constructor => $const,
        type        => $type
    );

    my $file = $helper->{file};
    $helper->render_file( 'compclass', $file, \%args );
}

=head1 AUTHOR

Dann C<< <techmemo@gmail.com> >>

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as perl itself.

No copyright claim is asserted over the generated code.

=cut

1;

__DATA__

__compclass__
package [% class %];
use strict;
use warnings;
use base 'Catalyst::Model::[% type %]';

__PACKAGE__->config( 
    package     => '[% package || 'Fill::This::In' %]',
);

1;

