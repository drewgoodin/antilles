#!/usr/bin/env perl
use strict;
use warnings;
use HTML::Mason::Interp;

my %cfg;

open my $fh, '<', 'cfg.txt';

for (<$fh>) {
  chomp;
  my @line = split ':' => $_;
  $cfg{$line[0]} = $line[1];
}

close $fh;

my $interp = HTML::Mason::Interp->new(
  comp_root => $ENV{PWD},
);

my $buf;
$interp->out_method(\$buf);

sub trav {
  my $dir = shift;
  opendir (my $dh, $dir);
  my @items = readdir $dh;
  for (@items) {
    next if $_ eq '.';
    next if $_ eq '..';
    next if $_ eq '.gitignore';
    my $path = "$dir/$_";
    if (-f "$path") {
      $interp->exec("/$path", %cfg);
      $path =~ s/pages\/markdown\///;
      open my $fh, '>', "site/$path";
      print $fh $buf;
      $buf = undef;
    }
    if (-d "$path") {
      my $tmp = $path;
      $tmp =~ s/pages\/markdown\///;
      mkdir "site/$tmp";
      trav("$path")
    }
  }
}

trav('pages/markdown');
