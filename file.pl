#!/usr/bin/perl


open FILE, "lista_de_usuarios.csv" or die $!; 	

my @cabeceras = split(',',<FILE>);		# saca las etiquetas

print "@cabeceras[0]\n\n";
foreach	my $v (@cabeceras)
{
	print "$v\n";
}

while(my $linea = <FILE>)
{
	print "$linea\n";
}
