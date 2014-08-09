use strict;
use warnings;
package Dist::Zilla::PluginBundle::ABE;

# ABSTRACT: Axel's list of preferred Dist::Zilla plugins

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

use namespace::autoclean;

=method configure

See L<Dist::Zilla::Role::PluginBundle::Easy>.

=cut

sub configure {
  my ($self) = @_;

  $self->add_plugins(
      qw(
         GatherDir
         PruneCruft
         PruneFiles
         ManifestSkip
         GithubMeta
         MetaYAML
         MetaJSON
         License
         Readme
         PodWeaver
         OurPkgVersion
         PodCoverageTests
         PodSyntaxTests
         ExtraTests
         ExecDir
         ShareDir
         Test::Perl::Critic
         MakeMaker
         Manifest
         AutoPrereqs
         Test::ReportPrereqs
         TestRelease
         ),
      # per-plugin configuration
      [
       PruneFiles => { filename => 'debian' },
      ],
      );
}

__PACKAGE__->meta->make_immutable;

=head1 DESCRIPTION

This is a Dist::Zilla plugin bundle based upon @Basic and @Classic,
but using OurPkgVersion and PodWeaver instead of PkgVersion and
PodVersion and not containing any upload functionality.

Additionally it uses AutoPrereqs, Test::ReportPrereqs, GithubMeta,
calls Test::Perl::Critic and generates both, META.yml and META.json.

The PruneFiles configuration also takes care of not shipping the
debian subdirectory (if present) to CPAN.

=cut

1;
