Dist::Zilla::PluginBundle::ABE
==============================

[![Travis CI Build Status](https://travis-ci.org/xtaran/dist-zilla-pluginbundle-abe.svg)](https://travis-ci.org/xtaran/dist-zilla-pluginbundle-abe)

This is [Axel](https://metacpan.org/author/ABE)'s own and preferred PluginBundle for Dist::Zilla.

It's based upon the PluginBundles `@Basic` and `@Classic`, but using
`OurPkgVersion` and `PodWeaver` instead of `PkgVersion` and
`PodVersion` and not containing any upload functionality.

Additionally it uses `AutoPrereqs`, `Test::ReportPrereqs`,
`GithubMeta`, calls `Test::Perl::Critic` and generates both,
`META.yml` and `META.json`.

The `PruneFiles` configuration also takes care of not shipping the
`debian` subdirectory (if present) to CPAN.


Taking Care of its Self-Reference
---------------------------------

The PluginBundle uses itself already, so you need to include the `lib`
directory when calling `dzil`, e.g. `dzil -Ilib test`.


Author, License and Copyright
-----------------------------

Copyright 2013-2014 Axel Beckert <abe@deuxchevaux.org>.

This program is free software; you can redistribute it and/or modify
it under the terms of either: the
[GNU General Public License](https://www.gnu.org/licenses/gpl) as
published by the [Free Software Foundation](https://www.fsf.org/),
either [version 1](https://www.gnu.org/licenses/old-licenses/gpl-1.0),
or (at your option)
[any later version](https://www.gnu.org/licenses/#GPL); or the
[Artistic License](http://dev.perl.org/licenses/artistic.html).

See http://dev.perl.org/licenses/ for more information.
