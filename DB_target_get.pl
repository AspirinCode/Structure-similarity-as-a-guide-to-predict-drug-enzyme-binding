#!/usr/bin/perl
#
# get DrugBank target by ID

my $DB_ID = $ARGV[0];
#for test:
#my $DB_ID = 'DB00171';
my $url = 'http://www.drugbank.ca/drugs/' . $DB_ID;

  use LWP::Simple;
  my $content = get $url;
  die "Couldn't get $url" unless defined $content;

my @lines = split('\n',$content);  
# Then go do things with $content, like this:
my $x = 0;
#print "pirma eilute: $lines[$x]\n";
while ($lines[$x] !~ "<\/html>") {
  if($lines[$x] =~ /uniprot.org/) {
    #print "$lines[$x]\n";
    my @line = split('"',$lines[$x]);
    my $uniprot_content = get $line[5];
    die "Couldn't get $uniprot_content" unless defined $content;
    #print $uniprot_content;
    my @uniprot_lines = split('"',$uniprot_content);
    foreach (@uniprot_lines) {
      if ($_ =~ /enzyme.expasy.org/) {
        $expasy_url = $_; 
        @expasy_url_parts = split('/', $expasy_url);
        print "$expasy_url_parts[4],";
      }
    }
  }
$x++;
}
print "\n";
