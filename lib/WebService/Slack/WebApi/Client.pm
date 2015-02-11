package WebService::Slack::WebApi::Client;
use strict;
use warnings;
use utf8;
use 5.10.0;

use Furl;
use JSON::XS;
use HTTP::Request::Common;
use Class::Accessor::Lite::Lazy (
    new     => 1,
    rw      => [qw/ team token /],
    ro_lazy => [qw/ ua /],
);

sub _build_ua { Furl->new() }

sub base_url {
    my $self = shift;
    my $team = $self->team ? $self->team . '.' : '';
    return sprintf 'https://%sslack.com/api', $team;
}

sub request {
    my ($self, $path, $params) = @_;

    my $request = POST $self->base_url . $path,
        Content_Type => 'form-data',
        Content      => [
            $self->token ? (token => $self->token) : (),
            %$params,
        ];
    my $response = $self->ua->request($request);

    return decode_json $response->content if $response->is_success;

    die 'fixme!!';
}

1;

