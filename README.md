# NAME

WebService::Slack::WebApi - a simple wrapper for Slack Web API

# SYNOPSIS

    use WebService::Slack::WebApi;

    # the token is required unless using $slack->oauth->access
    my $slack = WebService::Slack::WebApi->new(token => 'access token');

    # getting channel's descriptions
    my $channels = $slack->channels->list;

    # posting message to specified channel and getting message description
    my $posted_message = $slack->chat->post_message(
        channel  => 'channel id', # required
        text     => 'hoge',       # required
        username => 'fuga',       # optional
        # othre optional parameters...
    );

# DESCRIPTION

WebService::Slack::WebApi is a simple wrapper for Slack Web API (https://api.slack.com/web).

# METHODS

This module provides all methods declared in the API reference (https://api.slack.com/methods).

## Basis

`WebService::Slack::WebApi::Namespace::method_name` corresponds to `namespace.methodName` in Slack Web API.
For example `WebService::Slack::WebApi::Chat::post_message` corresponds to `chat.postMessage`.
You describe as below to call `Chat::post_message` method.

    my $result = $slack->chat->post_message;

## The token parameter

The API reference shows `chat.update` method require 4 parameters: `token`, `ts`, `channel` and `text`.
When using this module `token` parameter is added implicitly except using `oauth.access` method.
So you pass the other 3 parameters to `Chat::update` method as shown below.

    my $result = $slack->chat->update(
        ts      => '1401383885.000061',  # as Str
        channel => 'channel id',
        text    => 'hoge',
    );

## Optional parameters

Some methods have optional parameters.
If a parameter is optional in the API reference, it is also optional in this module.

## Not primitive parameters

These parameters are not primitive:

- `files.upload.file`: string of path to local file
- `files.upload.channels`: ArrayRef of channel id string

# SEE ALSO

- https://api.slack.com/web
- https://api.slack.com/methods

# AUTHOR

Mihyaeru/mihyaeru21 <mihyaeru21@gmail.com>

# LICENSE

Copyright (C) Mihyaeru/mihyaeru21

Released under the MIT license.

See `LICENSE` file.
