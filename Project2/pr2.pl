#!/usr/bin/perl
# project 2

displayMenu();
my $input = <STDIN>;
chomp($input);

if ($input == 1) {
    firstNameSort();
}
elsif ($input == 2) {
    lastNameSort();
}
elsif ($input == 3) {
    firstNameSortReverse();
}
elsif ($input == 4) {
    lastNameSortReverse();
}
elsif ($input == 5) {
    print "Enter the last name:\n";
    my $name = <STDIN>;
    chomp($name);
    searchLastName($name);
}
elsif ($input == 6) {
    print "Enter the year:\n";
    my $year = <STDIN>;
    chomp($year);
    searchYear($year);
}
elsif ($input == 7) {
    print "Enter the month:\n";
    my $month = <STDIN>;
    chomp($month);
    searchMonth($month);
}

# Subroutines.

# displays the menu
sub displayMenu{
    print "(1) Listing of records in alphabetical order of first name\n";
    print "(2) Listing of records in alphabetical order of last name\n";
    print "(3) Listing of records in reverse alphabetical order of first name\n";
    print "(4) Listing of records in reverse alphabetical order of last name\n";
    print "(5) Search for a record by Last Name and print out the result.\n";
    print "(6) Search for a record by birthday in a given year.\n";
    print "(7) Search for a record by birthday in a given month.\n";
}

sub lastNameSort{
    my $lnameSort = `cat data.txt | sort -k 2`;
    print $lnameSort;
}

sub lastNameSortReverse(){
    my $lnameSortR = `cat data.txt | sort -r -k 2`;
    print $lnameSortR;
}

sub firstNameSort{
    my $fnameSort = `cat data.txt | sort`;
    print $fnameSort;
}

sub firstNameSortReverse() {
    my $fnameSortR = `cat data.txt | sort -r`;
    print $fnameSortR;
}

# get data.txt file using a shell command
sub getData{
    my $data = `cat data.txt`;
    return $data;
}

sub searchLastName() {
    my $lastName = $_[0];
    my $result = `awk -F'[: ]' '\$2 == "$lastName"' data.txt`;
    print "$result";
}

sub searchYear() {
    my $year = $_[0];
    my $result = `awk -F'[:/]' '\$7 == "$year"' data.txt`;
    print "$result";
}

sub searchMonth() {
    my $month = $_[0];
    print "month: $month\n";
    my $result = `awk -F'[:/]' '\$5 == "$month"' data.txt`;
    print "$result";
}
