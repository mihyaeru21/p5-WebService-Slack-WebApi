package WebService::Slack::WebApi::Usergroups;
use strict;
use warnings;
use utf8;

use parent 'WebService::Slack::WebApi::Base';

use WebService::Slack::WebApi::Usergroups::Users;

use Class::Accessor::Lite::Lazy (
    ro_lazy => [qw/ users /],
);

use WebService::Slack::WebApi::Generator (
    create => {
        name => 'Str',
        channels => { isa => 'ArrayRef', optional => 1 },
        description   => { isa => 'Str',  optional => 1 },
        handle   => { isa => 'Str',  optional => 1 },
        include_count => { isa => 'Bool', optional => 1 },
        team_id   => { isa => 'Str',  optional => 1 },
    },
    disable => {
        usergroup   => 'Str',
        include_count => { isa => 'Bool', optional => 1 },
        team_id    => { isa => 'Str',  optional => 1 },
    },
    enable => {
        usergroup   => 'Str',
        include_count => { isa => 'Bool', optional => 1 },
        team_id    => { isa => 'Str',  optional => 1 },
    },
    list => {
        include_count => { isa => 'Bool', optional => 1 },
        include_disabled => { isa => 'Bool', optional => 1 },
        include_users => { isa => 'Bool', optional => 1 },
        team_id    => { isa => 'Str',  optional => 1 },
    },
    update => {
        channels => { isa => 'Str', optional => 1 },
        description => { isa => 'Str', optional => 1 },
        handle => { isa => 'Str', optional => 1 },
        include_count => { isa => 'Bool', optional => 1 },
        name => { isa => 'Str', optional => 1 },
        team_id => { isa => 'Str', optional => 1 },
    },
);

sub _build_users {
    return WebService::Slack::WebApi::Usergroups::Users->new(client => shift->client);
}


1;

