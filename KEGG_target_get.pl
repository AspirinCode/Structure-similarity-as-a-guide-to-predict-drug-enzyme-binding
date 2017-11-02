#!/usr/bin/perl
#
# get KEGG target by ID


my $KEGG_ID = $ARGV[0];
my $url = 'http://www.genome.jp/dbget-bin/www_bget?cpd:' . $KEGG_ID;

  use LWP::Simple;
  my $content = get $url;
  die "Couldn't get $url" unless defined $content;

my @lines = split('\n',$content);  
# Then go do things with $content, like this:
my $x = 0;
#print "pirma eilute: $lines[$x]\n";
while ($lines[$x] ne "<\/html>") {
  #print STDERR "$lines[$x]\n";
  if ($su_enzyme) {
    #print STDERR "$lines[$x]\n";
    my @line = split('ec:', $lines[$x]);
    #o dabar kiekvieno @line elemento pradzioj EC"... arba k.t.
    foreach (@line) {
      my @EC = split('"', $_);
      print "$EC[0]," if (!($EC[0] =~ m/</i));
    }
  }
  if($lines[$x] =~ m/<nobr>Enzyme<\/nobr>/i) {
    #print STDERR "They're talking about Enzyme today on line $x!\n";
    $su_enzyme = 1;
  }
  $su_enzyme = 0 if($su_enzyme && $lines[$x] eq "<\/div><\/td><\/tr>");
$x++;
}
print "\n";
