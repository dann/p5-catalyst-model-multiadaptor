package TestApp::Web::Model::Service;
use strict;
use warnings;
use base 'Catalyst::Model::MultiAdaptor';

__PACKAGE__->config( package => 'TestApp::Service' );

1;
