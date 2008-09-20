package Catalyst::Model::MultiAdaptor::Base;
use strict;
use warnings;
use Carp;
use Class::C3;
use Class::MOP;
use Sub::Install;
use Module::Pluggable::Object;

use base 'Catalyst::Model';

sub load_services {
    my $self         = shift;
    my $base_package = $self->{package};
    my $finder
        = Module::Pluggable::Object->new( search_path => $base_package );
    for my $service ( $finder->plugins ) {
        $self->_install_service_as_model($service);
    }

}

sub _install_service_as_model {
    my ( $self, $service ) = @_;
    my $classname
        = $self->_convert2classname( $service, $self->{base_class} );
    my $instance = $self->_create_instance($service);
    Sub::Install::install_sub(
        {   code => sub { return $instance },
            into => $classname,
            as   => 'ACCEPT_CONTEXT',
        }
    );
}

sub _convert2classname {
    my ( $self, $service, $base_class ) = @_;
    my $class              = ref($self);
    my $short_service_name = $service;
    $short_service_name =~ s/^$base_class\:\://g;
    return "${class}::$short_service_name";
}

sub _create_instance {
    my ( $self, $adapted_class ) = @_;
    Class::MOP::load_class($adapted_class);
    return $adapted_class->new();
}

1;

__END__
