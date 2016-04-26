#!/usr/bin/perl

#	Nombre: Cristian Beltran
#	Profesor: Alejandro Mellado
#	Descripcion: Crear Un archivo xml desde un csv
#	Carrera: Ing Civil Informatica UCT


open FILE, "lista_de_usuarios.csv" or die $!; 	
open my $fh,'>','archivoXML.xml' or die $!;		# archivo final


my @cabeceras = split(',',<FILE>);		# obtiene las etiquetas

foreach	my $v (@cabeceras)
{
	$v =~ s/\s/_/;	# reemplaza espacios, para evitar errores
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

close($fh);
close(FILE);
print "Archivo Creado Exitosamente!!\n";
