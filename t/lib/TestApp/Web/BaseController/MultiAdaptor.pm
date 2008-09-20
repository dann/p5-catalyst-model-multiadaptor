package TestApp::Web::BaseController::MultiAdaptor;
use strict;
use warnings;
use base 'Catalyst::Controller';

sub model { shift->{model} }

sub is_a :Path(isa) {
    my ($self, $c) = @_;
    $c->res->body(ref $c->model($self->model));
}

sub counter : Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model)->counter);
}

sub id :Local {
    my ($self, $c) = @_;
    $c->res->body($c->model($self->model)->id);
}

1;
