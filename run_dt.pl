#!/usr/bin/perl

use strict;

my $template_file = $ARGV[0];
my $file_out;

my $refine =3;
my $cpus =1;
my @dt = (); # array of dt values
my $dt_max =0.064; # largest value of dt
my $n_dt=10;     # number of dt refinements

# populate the dt array with values
$dt[0]=$dt_max;
for my $i (1..$n_dt){
    $dt[$i] = $dt[$i-1] / 2.;
}
print "size of dt array is $#dt \n\n";

print "template input file is $template_file \n";

# loop on dt values
for my $i (0..$#dt) {
        
    # set current dt
    my $curr_dt =$dt[$i];
    print "\nchosen dt is $curr_dt \n" ;
        
    # create new pbs filename (not the file itself, just its NAME)
    if($i<10){
        $file_out = $template_file."_dt_0".$i ;
    }
    else{
        $file_out = $template_file."_dt_".$i ;
    }
    $file_out = $file_out.".pbs";
    print "new pbs filename is: $file_out \n";
    
    # open template pbs and new pbs file (the new file is empty) 
    open my $in,  '<', $template_file  or die "Can't input $template_file  !";
    open my $out, '>', $file_out or die "Can't input $file_out !";
    
    # change the dummy characters 
    while (<$in>) {
        s/mydt/$curr_dt/g;
        s/myinteger/$i/g;
        s/myrefine/$refine/g;
        s/mycpus/$cpus/g;
        print $out $_;
    }
    close $in; close $out;
    
    # run qsub 
    my $cmd = "qsub $file_out";
    # system($cmd);
}

exit 66;
