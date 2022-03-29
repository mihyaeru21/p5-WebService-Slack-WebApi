use strict;
use warnings;
use utf8;
use feature qw/state/;

use Test::More;

use WebService::Slack::WebApi;

subtest 'new' => sub {
    subtest 'with_token' => sub {
        my $obj = WebService::Slack::WebApi->new(token => 'hoge');
        isa_ok $obj, 'WebService::Slack::WebApi';
        is $obj->token, 'hoge';
    };

    subtest 'with_team_domain_token' => sub {
        my $obj = WebService::Slack::WebApi->new(team_domain => 'foo', token => 'hoge');
        isa_ok $obj, 'WebService::Slack::WebApi';
        is $obj->team_domain, 'foo';
        is $obj->token, 'hoge';
    };
};

subtest 'types' => sub {
    my %methods = (
        client        => 'WebService::Slack::WebApi::Client',
        api           => 'WebService::Slack::WebApi::Api',
        auth          => 'WebService::Slack::WebApi::Auth',
        channels      => 'WebService::Slack::WebApi::Channels',
        conversations => 'WebService::Slack::WebApi::Conversations',
        chat          => 'WebService::Slack::WebApi::Chat',
        dialog        => 'WebService::Slack::WebApi::Dialog',
        emoji         => 'WebService::Slack::WebApi::Emoji',
        files         => 'WebService::Slack::WebApi::Files',
        groups        => 'WebService::Slack::WebApi::Groups',
        im            => 'WebService::Slack::WebApi::Im',
        oauth         => 'WebService::Slack::WebApi::Oauth',
        pins          => 'WebService::Slack::WebApi::Pins',
        rtm           => 'WebService::Slack::WebApi::Rtm',
        search        => 'WebService::Slack::WebApi::Search',
        stars         => 'WebService::Slack::WebApi::Stars',
        team          => 'WebService::Slack::WebApi::Team',
        users         => 'WebService::Slack::WebApi::Users',
        dnd           => 'WebService::Slack::WebApi::Dnd',
        bots          => 'WebService::Slack::WebApi::Bots',
        migration     => 'WebService::Slack::WebApi::Migration',
        usergroups    => 'WebService::Slack::WebApi::Usergroups',
    );
    my $obj = WebService::Slack::WebApi->new(token => 'hoge');
    while (my ($method, $type) = each %methods) {
        isa_ok $obj->$method, $type;
    }

    isa_ok $obj->users->profile, 'WebService::Slack::WebApi::Users::Profile';
    isa_ok $obj->oauth->v2, 'WebService::Slack::WebApi::Oauth::V2';
    isa_ok $obj->usergroups->users, 'WebService::Slack::WebApi::Usergroups::Users';
};

subtest 'opts' => sub {
    subtest 'proxy' => sub {
        subtest 'opt_proxy' => sub {
            my $obj = WebService::Slack::WebApi->new(token => 'hoge', opt => {proxy => 'proxy'});
            my $ua = $obj->client->ua;
            is ${ $ua->{'ua'} }->{'proxy'}, 'proxy';
        };

        subtest 'env_proxy' => sub {
            local $ENV{HTTP_PROXY} = 'proxy';
            local $ENV{http_proxy} = 'proxy';
            my $obj = WebService::Slack::WebApi->new(token => 'hoge', opt => {env_proxy => 1});
            my $ua = $obj->client->ua;
            is ${ $ua->{'ua'} }->{'proxy'}, 'proxy';
        };
    };
};

done_testing;

