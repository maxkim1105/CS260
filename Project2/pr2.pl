#!/usr/bin/perl
# project 2


# get data file by calling a shell command
my $data = getData();
my $result = searchLastName();
#my $result = `awk -F'[: ]' '\$2 == "Corder"' data.txt`;

print "GORDONL \n$result";

displayMenu();
my $input = <STDIN>;
chomp($input);

if ($input == 1) {
    firstNameSort();
}
elsif ($inpyt == 2) {
    lastNameSort();
}
elsif ($input == 3) {
    firstNameSortReverse();
}
elsif ($input == 4) {
    lastNameSortReverse();
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

# displays the menu
sub displayMenu{
    print "(1) Listing of records in alphabetical order of first name\n";
    print "(2) Listing of records in alphabetical order of last name\n";
    print "(3) Listing of records in reverse alphabetical order of first name\n";
    print "(4) Listing of records in reverse alphabetical order of last name\n";
    print "(5) Search for a record by Last Name and print out the result.\n";
    print "(6) Search for a record by birthday in a given year or month.\n";
}

sub searchLastName() {
    # awk -F'[: ]' '$2 == "Corder"' data.txt
    #my $name = "Corder";
    my $result = `awk -F'[: ]' '\$2 == "Corder"' data.txt`;
    # print "HERE------\n $result\n";
}
