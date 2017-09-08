use strict;
use warnings;
use utf8;
use 5.10.0;

use Test::More;
use t::Util qw/ slack set_any_mock_response /;

my %tests = (
    auth => {
        revoke => {
            test => 1,
        },
        test => +{},
    },
    channels => {
        archive => {
            channel => 'hoge',
        },
        create => {
            name     => 'hoge',
            validate => 1,
        },
        history => {
            channel   => 'hoge',
            count     => 100,
            inclusive => 1,
            latest    => '1234567890.123456',
            oldest    => '1234567890.123456',
            unreads   => 1,
        },
        info => {
            channel => 'hoge',
        },
        invite => {
            channel => 'hoge',
            user    => 'hoge',
        },
        join => {
            name     => 'hoge',
            validate => 1,
        },
        kick => {
            channel => 'hoge',
            user    => 'hoge',
        },
        leave => {
            channel => 'hoge',
        },
        list => {
            cursor           => 'dXNlcjpVMDYxTkZUVDI=',
            exclude_archived => 1,
            exclude_members  => 1,
            limit            => 20,
        },
        mark => {
            channel => 'hoge',
            ts      => '1234567890.123456',
        },
        rename => {
            channel => 'hoge',
            name    => 'hoge',
        },
        replies => {
            channel   => 'hoge',
            thread_ts => '1234567890.123456',
        },
        set_purpose => {
            channel => 'hoge',
            purpose => 'hoge',
        },
        set_topic => {
            channel => 'hoge',
            topic   => 'hoge',
        },
        unarchive => {
            channel => 'hoge',
        },
    },
    chat => {
        delete => {
            channel => 'hoge',
            ts      => '1234567890.123456',
            as_user => 1,
        },
        me_message => {
            channel => 'hoge',
            text    => 'hoge',
        },
        post_ephemeral => {
            channel      => 'hoge',
            text         => 'hoge',
            user         => 'hoge',
            as_user      => 1,
            attachments  => [{hoge => 'fuga'}],
            link_names   => 1,
            parse        => 'hoge',
        },
        post_message => {
            channel         => 'hoge',
            text            => 'hoge',
            as_user         => 1,
            attachments     => [{hoge => 'fuga'}],
            icon_emoji      => ':poop:',
            icon_url        => 'https://hoge',
            link_names      => 1,
            parse           => 'hoge',
            reply_broadcast => 1,
            thread_ts       => '1234567890.123456',
            unfurl_links    => 1,
            unfurl_media    => 1,
            username        => 'hoge',
        },
        unfurl => {
            channel            => 'hoge',
            ts                 => '1234567890.123456',
            unfurls            => 'hoge',
            user_auth_message  => 'hoge',
            user_auth_required => 1,
            user_auth_url      => 'https://hoge',
        },
        update => {
            channel     => 'hoge',
            text        => 'hoge',
            ts          => '1234567890.123456',
            as_user     => 1,
            attachments => [{hoge => 'fuga'}],
            link_names  => 1,
            parse       => 'hoge',
        },
    },
    emoji => {
        list => +{},
    },
    files => {
        delete => {
            file => 'file_id',
        },
        info => {
            file  => 'file_id',
            count => 10,
            page  => 2,
        },
        list => {
            user    => 'user_id',
            ts_from => '1234567890.123456',
            ts_to   => '1234567890.123456',
            types   => 'image',
            count   => 10,
            page    => 2,
        },
        upload => {
            file            => __FILE__,       # using this file
            content         => 'hoge content',
            filetype        => 'type',
            filename        => 'name',
            title           => 'hoge title',
            initial_comment => 'initial hoge',
            channels        => ['hoge', 'fuga'],
        },
    },
    groups => {
        archive => {
            channel => 'hoge',
        },
        close => {
            channel => 'hoge',
        },
        create => {
            name => 'hoge',
        },
        create_child => {
            channel => 'hoge',
        },
        history => {
            channel   => 'hoge',
            latest    => '1234567890.123456',
            oldest    => '1234567890.123456',
            inclusive => 1,
            count     => 100,
        },
        info => {
            channel => 'hoge',
        },
        invite => {
            channel => 'hoge',
            user    => 'fuga',
        },
        kick => {
            channel => 'hoge',
            user    => 'fuga',
        },
        leave => {
            channel => 'hoge',
        },
        list => {
            exclude_archived => 1,
        },
        mark => {
            channel => 'hoge',
            ts      => '1234567890.123456',
        },
        open => {
            channel => 'hoge'
        },
        rename => {
            channel => 'hoge',
            name    => 'fuga',
        },
        set_purpose => {
            channel => 'hoge',
            purpose => 'fuga',
        },
        set_topic => {
            channel => 'hoge',
            topic   => 'fuga',
        },
        unarchive => {
            channel => 'hoge',
        },
    },
    im => {
        close => {
            channel => 'hoge',
        },
        history => {
            channel   => 'hoge',
            latest    => '1234567890.123456',
            oldest    => '1234567890.123456',
            inclusive => 1,
            count     => 100,
        },
        list => +{},
        mark => {
            channel => 'hoge',
            ts      => '1234567890.123456',
        },
        open => {
            user => 'hoge',
        },
    },
    oauth => {
        access => {
            client_id     => 'hoge',
            client_secret => 'fuga',
            code          => 'piyo',
            redirect_uri  => 'http://hoge.hoge',
        },
    },
    pins => {
        add => {
            channel      => 'C1234567890',
            file         => 'F1234567890',
            file_comment => 'Fc1234567890',
            timestamp    => '1234567890.123456',
        },
        list => {
            channel => 'C1234567890',
        },
        remove => {
            channel      => 'C1234567890',
            file         => 'F1234567890',
            file_comment => 'Fc1234567890',
            timestamp    => '1234567890.123456',
        },
    },
    reactions => {
        add => {
            name         => 'thumbsup',
            file         => 'F1234567890',
            file_comment => 'Fc1234567890',
            channel      => 'C1234567890',
            timestamp    => '1234567890.123456',
        },
        get => {
            file         => 'F1234567890',
            file_comment => 'Fc1234567890',
            channel      => 'C1234567890',
            timestamp    => '1234567890.123456',
            full         => 1,
        },
        list => {
            user  => 'U1234567890',
            full  => 1,
            count => 10,
            page  => 2,
        },
        remove => {
            name         => 'thumbsup',
            file         => 'F1234567890',
            file_comment => 'Fc1234567890',
            channel      => 'C1234567890',
            timestamp    => '1234567890.123456',
        },
    },
    rtm => {
        start => +{},
    },
    search => {
        all => {
            query     => 'hoge',
            sort      => 'key',
            sort_dir  => 'asc',
            highlight => 1,
            count     => 10,
            page      => 2,
        },
        files => {
            query     => 'hoge',
            sort      => 'key',
            sort_dir  => 'asc',
            highlight => 1,
            count     => 10,
            page      => 2,
        },
        messages => {
            query     => 'hoge',
            sort      => 'key',
            sort_dir  => 'asc',
            highlight => 1,
            count     => 10,
            page      => 2,
        },
    },
    stars => {
        list => {
            user  => 'hoge',
            count => 100,
            page  => 2,
        },
    },
    team => {
        access_logs => {
            count => 100,
            page  => 2,
        },
        info => {},
    },
    users => {
        get_presence => {
            user => 'hoge',
        },
        identity     => +{},
        info => {
            user => 'hoge',
        },
        list         => +{},
        set_active   => +{},
        set_presence => {
            presence => 'hoge',
        },
    },
);

set_any_mock_response;
my $slack = slack();

while (my ($ns, $methods) = each %tests) {
    subtest $ns => sub {
        while (my ($method, $args) = each %$methods) {
            isa_ok $slack->$ns->$method(%$args), 'HASH', "$method returns HashRef";
        }
    };
}

done_testing;

