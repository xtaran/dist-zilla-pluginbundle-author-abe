#!perl

use Test::More;

ok( system('cd ../..;dzil -Ilib build --no-tgz') == 0, '@Author::ABE can build itself' );

done_testing();
