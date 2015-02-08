package WebService::Slack::WebApi;
use strict;
use warnings;
use utf8;
use 5.18.0;

use Class::Load qw/ load_class /;
use Class::Accessor::Lite::Lazy (
    new     => 1,
    rw      => [qw/ team token /],
    ro_lazy => [qw/ client api auth channels chat emoji files groups im oauth rtm search stars users /],
);

use WebService::Slack::WebApi::Client;

our $VERSION = '0.01';

sub _build_client {
    my $self = shift;
    return WebService::Slack::WebApi::Client->new(
        team  => $self->team,
        token => $self->token,
    );
}

for my $class_name (qw/ api auth channels chat emoji files groups im oauth rtm search stars users /) {
    my $method = sprintf '%s::_build_%s', __PACKAGE__, $class_name;
    my $class  = sprintf '%s::%s', __PACKAGE__, ucfirst($class_name);

    no strict 'refs';
    *$method = sub {
        load_class $class;
        return $class->new(client => shift->client)
    };
}

1;

