package WebService::Slack::WebApi::Dnd;
use strict;
use warnings;
use utf8;
use feature qw/state/;

use parent 'WebService::Slack::WebApi::Base';

use JSON::XS;
use WebService::Slack::WebApi::Generator (
    end_dnd => {},
    end_snooze => {},
    info => {
        user => 'Str',
    },
    set_snooze => {
        num_minutes => 'Int',
    },
    # FIXME Need some testing with a team account
    # team_info => {
    #     users   => 'ArrayRef',
    #     optional => 1,
    # }
);


1;

