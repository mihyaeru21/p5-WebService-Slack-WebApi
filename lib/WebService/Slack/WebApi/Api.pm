package WebService::Slack::WebApi::Api;
use strict;
use warnings;
use utf8;
use 5.18.0;

use parent 'WebService::Slack::WebApi::Base';

sub test {
    my ($self, %args) = shift;
    return $self->request('test', \%args);
}

1;

