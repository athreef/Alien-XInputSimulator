use Test::More;
use Test::Alien::CPP;
plan tests => 2;
use_ok 'Alien::XInputSimulator';
alien_ok 'Alien::XInputSimulator';
diag 'CFLAGS=' . Alien::XInputSimulator->cflags;
diag 'LDFLAGS=' . Alien::XInputSimulator->libs;

