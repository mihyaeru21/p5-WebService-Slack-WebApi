package WebService::Slack::WebApi::Oauth::V2;
use strict;
use warnings;
use utf8;
use feature qw/ state /;

use parent 'WebService::Slack::WebApi::Base';

# override
sub base_name { 'oauth.v2' }

sub access {
    state $rule = Data::Validator->new(
        code          => 'Str',
        client_id     => { isa => 'Str', optional => 1 },
        client_secret => { isa => 'Str', optional => 1 },
        redirect_uri  => { isa => 'Str', optional => 1 },
    )->with('Method');
    my ($self, $args) = $rule->validate(@_);

    return $self->request('access', { %$args });
}

1;

