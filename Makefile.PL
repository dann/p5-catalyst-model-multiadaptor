use inc::Module::Install;
name 'Catalyst-Model-MultiAdaptor';
all_from 'lib/Catalyst/Model/MultiAdaptor.pm';

requires $_
    for (
    qw/
    Sub::Install
    Class::MOP
    Class::C3
    Catalyst::Model
    Module::Pluggable::Object
    /
    );

build_requires $_
    for (
    qw/
    Test::More
    Catalyst::Test
    /
    );
use_test_base;
auto_include;
WriteAll;
