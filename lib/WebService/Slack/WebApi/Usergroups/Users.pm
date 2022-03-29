package WebService::Slack::WebApi::Usergroups::Users;
use strict;
use warnings;
use utf8;
use feature qw/state/;

use parent 'WebService::Slack::WebApi::Base';

use WebService::Slack::WebApi::Generator (
    list => {
	usergroup => 'Str',
        include_disabled => { isa => 'Bool', optional => 1 },
        team_id           => { isa => 'Str',  optional => 1 },
    },
    update => {
	usergroup => 'Str',
	channels => { isa => 'ArrayRef', optional => 1 },
	description => { isa => 'Str', optional => 1 },
	handle => { isa => 'Str', optional => 1 },
	include_count => { isa => 'Bool', optional => 1 },
	name => { isa => 'Str', optional => 1 },
	team_id => { isa => 'Str', optional => 1 },
    },
);

sub base_name { 'usergroups.users' }

1;

