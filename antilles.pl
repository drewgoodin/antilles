#!/usr/bin/env perl
use strict;
use warnings;
use HTML::Mason::Interp;
use File::Copy qw!copy!;

my %cfg;
my $buf;
my $directory;
my $path;
my $interp = HTML::Mason::Interp->new(
  comp_root => "$ENV{PWD}/pages",
);

$interp->out_method(\$buf);

mkdir 'site' unless -d 'site';

open my $fh, '<', 'cfg.txt';
for (<$fh>) {
  chomp;
  my @line = split ':' => $_;
  $cfg{$line[0]} = $line[1];
}
close $fh;

my %dispatch = (
  pages     => sub {
                      $path =~ s/pages\///;
                      $interp->exec("/$path", %cfg);
                      open my $fh, '>', "site/$path" or die "could not write to file in site directory";
                      print $fh $buf;
                      $buf = undef;
               },
  resources => sub {
                     $path =~ s/resources\///;
                     copy "resources/$path", "site/$path" or die "could not copy file to site directory";
               }
);

sub trav {
  my $dir = shift;
  opendir (my $dh, $dir);
  my @items = readdir $dh;
  for (@items) {
    next if $_ eq '.';
    next if $_ eq '..';
    next if $_ eq '.gitignore';
    next if $_ eq 'autohandler';
    $path = "$dir/$_";
    $dispatch{$directory}->() if -f $path;
    if (-d "$path") {
      my $tmp = $path;
      $tmp =~ s/$directory\///;
      mkdir "site/$tmp" unless -d "site/$tmp";
      trav("$path");
    }
  }
}

$directory = 'pages';
trav($directory);
$directory = 'resources';
trav($directory);
