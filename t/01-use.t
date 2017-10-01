use Test::More;
use Test::Alien;
plan tests => 4;
use_ok 'Alien::XInputSimulator';
alien_ok 'Alien::XInputSimulator';
diag "CFLAGS='".Alien::XInputSimulator->cflags."' LDFLAGS='".Alien::XInputSimulator->static_libs."'";
ok Alien::XInputSimulator->cflags, "CFLAGS is non-empty";
ok Alien::XInputSimulator->static_libs, "STATIC_LDFLAGS is non-empty";

