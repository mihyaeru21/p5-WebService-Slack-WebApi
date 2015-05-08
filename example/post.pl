use strict;
use warnings;
use utf8;
use 5.10.0;

use Data::Dumper;
use WebService::Slack::WebApi;

my $slack = WebService::Slack::WebApi->new(token => 'access token');
my $posted_message = $slack->chat->post_message(
    channel => '#sandbox',
    text    => 'test',
    as_user => 1,
);

say Dumper $posted_message;

