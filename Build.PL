use Alien::Base::ModuleBuild;
use Config;
use Alien::CMake;

my $cmake = Alien::CMake->config('prefix') . '/bin/cmake';
my $ctest = Alien::CMake->config('prefix') . '/bin/ctest';
my $build = Alien::Base::ModuleBuild->new(
    module_name => 'Alien::XInputSimulator',
    alien_name => 'XInputSimulator',
    dist_author => 'Ahmad Fatoum <athreef@cpan.org>',
    license => 'perl',

    alien_repository => {
        protocol => 'http',
        host     => 'github.com',
        location => '/a3f/XInputSimulator/archive',
        exact_filename => 'master.tar.gz'
    },
    alien_bin_requires => {
        'Alien::CMake' => '0.07',
    },
    configure_requires => {
        'Alien::Base::ModuleBuild' => '0.046',
        'Module::Build' => 0,
        'Alien::CMake' => '0.07',
    },
    build_requires => {
        'Alien::CMake' => '0.07',
        # TODO: fallback to HTTP download when IO::Socket::SSL doesn't exist
        'IO::Socket::SSL' => 0
    },
    recommends => {
        'IO::Socket::SSL' => 0,
    },
    test_requires => {
        'Test::Alien::CPP'    => '0.99',
    },
    requires => {
        'perl' => '5.008',
        'Alien::Base' => '0.030',
    },
    alien_inline_auto_include => [ 'xinputsimulator.h' ],
    alien_stage_install => 1,
    alien_build_commands => [
        "$cmake"
        . ' -DWITH_PIC=ON -DBUILD_MANUAL_TEST=OFF -DBUILD_MACOS_FATLIB=OFF'
        . ' -DCMAKE_INSTALL_PREFIX:PATH=%s XInputSimulator',

        "$cmake --build ."
     ],
    alien_install_commands => ["$cmake --build . --target install"],

    alien_test_commands => [
    ],

    alien_isolate_dynamic => 1,
);

$build->create_build_script;
$build->dispatch('distmeta');
#$build->dispatch('manifest');
#$build->dispatch('build');
