package t::Util;
use strict;
use warnings;
use utf8;
use 5.10.0;

use Test::Mock::Furl;

use JSON::XS;
use Furl::Response;
use Exporter qw/ import /;

use WebService::Slack::WebApi;

our @EXPORT_OK = qw/ slack set_mock_response set_any_mock_response /;

sub slack { WebService::Slack::WebApi->new(token => 'a') }

sub set_mock_response {
    my $content = shift;

    $Mock_furl->mock(request => sub { Furl::Response->new });
    $Mock_furl_res->mock(content => sub { return encode_json $content });
}

sub set_any_mock_response { set_mock_response +{hoge => 'fuga'} }

1;

