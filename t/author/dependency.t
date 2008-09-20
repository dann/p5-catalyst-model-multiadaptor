use Test::Dependencies
	exclude => [qw/Test::Dependencies Test::Base Test::Perl::Critic Catalyst::Model::MultiAdaptor Catalyst::Model/],
	style   => 'light';
ok_dependencies();
