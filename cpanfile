requires 'perl', '5.010';

requires 'Class::Accessor::Lite';
requires 'Class::Accessor::Lite::Lazy';
requires 'Class::Load';
requires 'Data::Validator';
requires 'Exception::Tiny';
requires 'HTTP::AnyUA';
requires 'IO::Socket::SSL';
requires 'JSON::XS';

recommends 'Furl';

on 'test' => sub {
    requires 'Test::More';
    requires 'Test::Exception';
    requires 'Devel::Cover::Report::Coveralls';
    requires 'Furl';
};
