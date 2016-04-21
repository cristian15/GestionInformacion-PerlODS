#!/usr/bin/python

#	Nombre: Cristian Beltran
#	Profesor: Alejandro Mellado
#	Descripcion: Lee archivo xml con libreria y lo muestra
#	Carrera: Ing Civil Informatica UCT


import xml.etree.ElementTree as XML

root = XML.parse('archivoXML.xml').getroot()

for p in root:
	for v in p:
		print v.tag + ': ' + v.text
	print '\n'
	

