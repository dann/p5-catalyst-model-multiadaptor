package TestApp::Logic::AnotherClass;
use Moose;

has 'count' => (
    is      => 'rw',
    isa     => 'Int',
    default => sub {
        0;
    }
);

has 'id' => ( is => 'rw', );

no Moose;

sub count {
    my $self = shift;
    return $self->count = $self->{count} + 1;
}

sub id {
    my $self = shift;
    return $self->id;
}

__PACKAGE__->meta->make_immutable;

1;
