#!/usr/bin/perl

# Because PluginBundle can not easily use themselves, this test
# vaguely checks that all plugins listed in the bundle are also used
# to package that bundle.

use strict;
use warnings;
use Test::More;
use File::Slurp;
use File::Find;
use Config::INI::Reader;
use Set::Scalar;

my $dist_ini = Config::INI::Reader->read_file('dist.ini');
ok( $dist_ini, 'Found dist.ini and it was parsed by Config::INI::Reader' );

my @pm_found = ();
sub wanted {
    if (-f $_ and
        -r  _ and
        /\.pm$/) {
        push(@pm_found, $File::Find::name);
    }
}
find(\&wanted, qw(lib));
ok ( @pm_found, 'Found a perl module in lib') ;
ok ( (@pm_found) == 1, 'Found exactly one perl module in lib') ;

my $pm_file = read_file($pm_found[0]);
ok( $pm_file, 'Perl module has some contents' );

my @module_list =
    map { s/^\s*(\S+)\s*$/$1/; $_ }
    grep { /^\s+[A-Z][A-Za-z0-9:]*$/ }
    split(/\n/, $pm_file);
ok( @module_list, 'Found some modules listed in the perl module' );

my $set_pm       = Set::Scalar->new(@module_list);
my $set_dist_ini = Set::Scalar->new(keys %$dist_ini);

foreach my $member ($set_pm->members) {
    ok( $set_dist_ini->has($member),
        "$member is listed in dist.ini");
}

done_testing;
