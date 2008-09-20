#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

BEGIN {
    plan skip_all => 'this test needs Test::WWW::Mechanize::Catalyst'
      unless eval "require Test::WWW::Mechanize::Catalyst";

    plan tests => 5;
}

# make sure testapp works
use ok 'TestApp::Web';

# a live test against TestApp, the test application
use Test::WWW::Mechanize::Catalyst 'TestApp::Web';
my $mech = Test::WWW::Mechanize::Catalyst->new;
$mech->get_ok('http://localhost:3000/', 'get main page');
$mech->content_like(qr/it works/i, 'see if it has our text');

# adaptor
{
    $mech->get_ok('http://localhost:3000/multiadaptor/isa', 'get the class name');
    $mech->content_like(qr/^TestApp::Service::SomeClass$/,
                        'adapted class is itself');
}

