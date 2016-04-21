#!/usr/bin/perl


open FILE, "lista_de_usuarios.csv" or die $!; 	

open my $fh,'>','archivoXML.xml' or die $!;		# archivo final



my @cabeceras = split(',',<FILE>);		# saca las etiquetas

foreach	my $v (@cabeceras)
{
	$v =~ s/\s/_/;	# reemplaza espacios, para evitar errores
	#print "$v\n";
}

print $fh "<?xml version='1.0' encoding='UTF-8'?>\n";
print $fh "<Personas>\n";
my $j=1;
while(my $linea = <FILE>)
{
	my @info = split(',',$linea);
	print $fh "<Persona$j>\n";
	my $i=0;
	foreach my $dato (@info)
	{	
		my $c = @cabeceras[$i];
		print $fh "<$c>$dato</$c>\n"; 
		$i++;
	}
	print $fh "</Persona$j>\n";	
	$j++;
	
}
print $fh "</Personas>\n";

print "Archivo Creado Exitosamente!!\n";
