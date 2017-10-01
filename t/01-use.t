use Test::More;
use Test::Alien;
plan tests => 4;
use_ok 'Alien::XInputSimulator';
alien_ok 'Alien::XInputSimulator';
diag "CFLAGS='".Alien::XInputSimulator->cflags."' LDFLAGS='".Alien::XInputSimulator->libs."'";
ok Alien::XInputSimulator->cflags, "CFLAGS is non-empty";
ok Alien::XInputSimulator->libs, "LDFLAGS is non-empty";

