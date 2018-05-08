#!/usr/bin/perl
system("printf \"\e[8;20;85;t\"");
print "\nReglas:\nDebe alinear verticalmente a nuestro intrepido aventurero -|- con el poofball *\n";
print "Ingrese 'a' para moverse a la izquierda y 'd' para moverse a la derecha : \n\n";
my $TABLE = 42;	
my @SPACES;
my @AST;
foreach (0..$TABLE) {
		push @SPACES, " ";
		push @AST, "+";
}
pop @SPACES;
my $nombre;
my @tabs = (" "," "," "," "," "," "," "," "," "," "," "," ");
my @tabsMeta = (" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");
my $contador = 1; 
while($nombre ne "exit\n"){
	$contador++;
	if($contador % 2 == 0){
			@tabsMeta = movMeta( @tabsMeta );
	}
  	$nombre=<STDIN>;
  	if($nombre eq "a\n" && scalar( @tabs ) > 0){
			pop( @tabs );
  	}elsif( $nombre eq "d\n" ){
   			push @tabs," ";
  	}
  	my $num_spaces_tabs = $TABLE - (scalar(@tabs) + 2);
  	my $num_spaces_tabsmeta = $TABLE - (scalar(@tabsMeta) + 2);
  	my @spaces_tabs;
  	my @spaces_tabsmeta;
 
 	foreach (0..$num_spaces_tabs){
	    push @spaces_tabs, " ";
	}
	foreach (0..$num_spaces_tabsmeta){
			push @spaces_tabsmeta, " ";
	}
	print("$spaces_tabs+");
	system("clear");
	print "\n\n\n\n\n\n\n";
	print "@AST\n";
	print "+@SPACES+\n";
	print "+@tabs-|-@spaces_tabs+\n";
	print "+@tabsMeta * @spaces_tabsmeta+\n";
	print "+@SPACES+\n";
	print "@AST\n";
	if(scalar( @tabs ) == scalar( @tabsMeta )){
			print "\n\n\n\t\t\t\t\t\t\t\t\t\t YOU WIN!!!\n\n\n";
			$nombre = "exit\n"
	}
}
print "\nAdios\n";

sub movMeta {
	my @tabs = @_;
  	my $movement = int(rand( 17 ));
  	my $direc = int(rand(2));
  	if( $direc == 1){
		for ( 0..$movement ){
      		if(scalar( @tabs ) > 0){
        		pop( @tabs ); 
      		}   
    	}
    }else{
		for ( 0..$movement ){
			if(scalar( @tabs ) < 41){
        		push @tabs, " ";
      		}
		}
  }
  return @tabs;
} 

sub movMetaIA {
   my ($tabs_ref, $tabsMeta_ref) = @_;
   my @tabs  = @{ $tabs_ref };      
   my @tabsMeta = @{ $tabsMeta_ref };
   my $movement = int(rand(17));
   my $direc = int(rand(2));
   
  # my posMeta = scalar(@tabs) + $movement;
  # if () {
     # body...
  # }

   return @tabs;
} 
















