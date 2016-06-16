#!/usr/bin/perl

use strict;

my $template_file = $ARGV[0];
my $file_out;

my @dt = (); # array of dt values
my @amp= (); # array of amp values
my $dt_max =0.1; # largest value of dt
my $micro_min = 10;
my $n_dt=3;     # number of dt refinements
my $n_amp=5;

# populate the dt and amp array with values
$dt[0]=$dt_max;
$amp[0]=$micro_min;
for my $i (1..$n_dt){
    $dt[$i] = $dt[$i-1] / 10.;
}
for my $i (1..$n_amp){
    $amp[$i] = $amp[$i-1] * 10.;
}
print "size of dt array is $#dt \n\n";

print "template input file is $template_file \n";

# loop on dt and amp values
for my $i (0..$#dt) {
for my $j (0..$#amp) {
        
    # set current dt and amp
    my $curr_dt =$dt[$i];
	my $curr_amp=$amp[$j];
    print "\nchosen dt is $curr_dt \n" ;
        
    # create new pbs filename (not the file itself, just its NAME)
    $file_out = $template_file."_dt_".$i."_amp_".$j ;
 
    $file_out = $file_out.".pbs";
    print "new pbs filename is: $file_out \n";
    
    # open template pbs and new pbs file (the new file is empty) 
    open my $in,  '<', $template_file  or die "Can't input $template_file  !";
    open my $out, '>', $file_out or die "Can't input $file_out !";
    
    # change the dummy characters 
    while (<$in>) {
        s/mydt/$curr_dt/g;
		s/myamp/$curr_amp/g;
        s/myintegerdt/$i/g;
		s/myintegeramp/$j/g;
        print $out $_;
    }
    close $in; close $out;
    
    # run qsub 
    my $cmd = "qsub $file_out";
    # system($cmd);
}
}
exit 66;
