#!/usr/bin/perl


#system("printf \"\e[8;20;85;t\"");
print "\nReglas:\nDebe alinear verticalmente a nuestro intrepido aventurero -|- con el poofball *\n";
print "Ingrese 'a' para moverse a la izquierda y 'd' para moverse a la derecha : \n\n";

my $TABLE = 42;	# Size of frame
my @SPACES; # Frame where you can play (FramePlay)
my @AST; # Frame (FrameStatic)

# Full FrameStatic and FramePlay
foreach (1..$TABLE) {
		push @SPACES, " ";
		push @AST, "+";
}

# FrameStatic have 2 more caracters than FramePlay
map { push @AST, "+" } (1..2);

# Put 2 more + in FramePlay to complete the whole frame (at first and the end of FramePlay)
unshift @SPACES, "+";
push @SPACES, "+";

# Scalar values of @AST and @SPACES
# print @AST ."\n";
# print @SPACES ."\n";

# STDIN
my $NOMBRE;

# First values of -|- and poofball
my @tabs = (" "," "," "," "," "," "," "," "," "," "," "," ");
my @tabsMeta = (" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," ");

my $contador = 1; 
while($NOMBRE ne "exit\n"){
	$contador++;
	if($contador % 2 == 0){
			@tabsMeta = movMeta( @tabsMeta );
	}

  	$NOMBRE=<STDIN>;

  	@tabs = movPlayer(@tabs);

  	my $num_spaces_tabs = $TABLE - ( scalar(@tabs) + 2 ) ;
  	my $num_spaces_tabsmeta = $TABLE - ( scalar(@tabsMeta) + 2 ) ;
  	my @spaces_tabs = fillSpaces( $num_spaces_tabs );
  	my @spaces_tabsmeta = fillSpaces( $num_spaces_tabsmeta );
 
	system("cls");
	print "\n\n\n\n\n\n\n";
	print "@AST\n";
	print "@SPACES\n";
  	unshift @tabs, "+";
  	push @spaces_tabs, "+";
	print "@tabs-|-@spaces_tabs\n";
  	unshift @tabsMeta, "+";
  	push @spaces_tabsmeta, "+";
	print "@tabsMeta * @spaces_tabsmeta\n";
	print "@SPACES\n";
	print "@AST\n";

  	shift @tabs;
  	shift @tabsMeta;
  	pop @spaces_tabsmeta;
  	pop @spaces_tabs;

  	isWin( \@tabs, \@tabsMeta);
}


print "\nAdios\n";

sub movMeta {
	my @tabs = @_;
	my $movement = int(rand( 17 ));
	my $direc = int(rand(2));
	my $until = $TABLE - 1;

	if( $direc == 1){
		  for ( 0..$movement ){
			if(scalar( @tabs ) > 0){
				pop( @tabs ); 
			}   
		}
	}else{
		  for ( 0..$movement ){
			   if(scalar( @tabs ) < $until){
				push @tabs, " ";
		 }
		  }
  }
  return @tabs;
} 


sub isWin {
	my $playerPos = shift; 
	my $poofballPos = shift;
	# print "Player position: " . @$playerPos . "\n";
	# print "Poofball position: " .@$poofballPos . "\n";

	if(scalar( @$playerPos ) == scalar( @$poofballPos )){
			print "\n\n\n YOU WIN!!!\n\n\n";
			$NOMBRE = "exit\n"
	}
}


sub movPlayer {
	my @playerPos = @_;

	if($NOMBRE eq "a\n" && scalar( @playerPos ) > 0){
		pop( @playerPos );
  	}elsif( $NOMBRE eq "d\n" ){
		push @playerPos," ";
  	}
  	return @playerPos;
}

sub fillSpaces {
	my $num_spaces = shift;
	my @spaces;
	map { push @spaces, " " } (0..$num_spaces);
	return @spaces
}













