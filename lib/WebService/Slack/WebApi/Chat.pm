package WebService::Slack::WebApi::Chat;
use strict;
use warnings;
use utf8;
use 5.10.0;

use parent 'WebService::Slack::WebApi::Base';

use WebService::Slack::WebApi::Generator (
    delete => {
        ts      => 'Str',
        channel => 'Str',
    },
    post_message => {
        channel      => 'Str',
        text         => 'Str',
        username     => { isa => 'Str',  optional => 1 },
        parse        => { isa => 'Str',  optional => 1 },
        link_names   => { isa => 'Bool', optional => 1 },
        attachments  => { isa => 'Str',  optional => 1 },
        unfurl_links => { isa => 'Str',  optional => 1 },
        unfurl_media => { isa => 'Str',  optional => 1 },
        icon_url     => { isa => 'Str',  optional => 1 },
        icon_emoji   => { isa => 'Str',  optional => 1 },
    },
    update => {
        ts      => 'Str',
        channel => 'Str',
        text    => 'Str',
    },
);

1;

