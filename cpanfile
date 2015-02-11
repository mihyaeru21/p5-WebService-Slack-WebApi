requires 'perl', '5.008001';

requires 'Class::Accessor::Lite::Lazy';
requires 'Class::Load';
requires 'Data::Validator';
requires 'Furl';
requires 'HTTP::Request::Common';
requires 'IO::Socket::SSL';
requires 'JSON::XS';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::Mock::Furl';
};
