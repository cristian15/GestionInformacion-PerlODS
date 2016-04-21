#!/usr/bin/perl


open FILE, "lista_de_usuarios.csv" or die $!; 	

open my $fh,'>','archivoXML.xml' or die $!;		# archivo final



my @cabeceras = split(',',<FILE>);		# saca las etiquetas

print "@cabeceras[0]\n\n";
foreach	my $v (@cabeceras)
{
	$v =~ s/\s/_/;	# reemplaza espacios, para evitar errores
	print "$v\n";
}

print $fh "<?xml version='1.0' encoding='UTF-8'?>\n";
print $fh "<personas>\n";
my $j=1;
while(my $linea = <FILE>)
{
	
	
	my @info = split(',',$linea);
	print $fh "<persona_$j>\n";
	my $i=0;
	foreach my $dato (@info)
	{	
		my $c = @cabeceras[$i];
		print $fh "<$c>$dato</$c>\n"; 
		$i++;
	}
	
	print $fh "</persona_$j>\n";	
	$j++;
	
}
print $fh "</personas>\n";
