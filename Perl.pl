#!/usr/bin/perl


#User input stuff :-)
print "Enter name: ";
chomp(my $name = <STDIN>);

print "Enter date: ";
chomp(my $date = <STDIN>);

print "Enter age: ";
chomp(my $age = <STDIN>);

print "About you: ";
chomp(my $about = <STDIN>);

# Format the output yeah!
print "\n=============================\n";
print "      **Personal Info**\n";
print "=============================\n";

print "Name : $name\n";
print "Date : $date\n";
print "Age  : $age\n";

print "\nAbout $name:\n";

my $width = 28;
my $current = 0;

#foreach loop (based on words) 
foreach my $word (split / /, $about) {
    if ($current + length($word) + 1 > $width) {
        print "\n$word";
        $current = length($word);
    } else {
        print " $word";
        $current += length($word) + 1;
    }
}

print "\n";
print "=============================\n";
