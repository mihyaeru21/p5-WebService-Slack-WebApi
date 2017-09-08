package WebService::Slack::WebApi::Pins;
use strict;
use warnings;
use utf8;

use parent 'WebService::Slack::WebApi::Base';

use WebService::Slack::WebApi::Generator (
    add => {
        channel   => 'Str',
        timestamp => 'Str',
    },
    list     => +{},
    remove => {
        channel   => 'Str',
        timestamp => 'Str',
    },
);

1;
