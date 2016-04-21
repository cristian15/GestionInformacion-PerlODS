#!/usr/bin/python

import xml.etree.ElementTree as XML

root = XML.parse('archivoXML.xml').getroot()

for p in root:
	for v in p:
		print v.tag + ': ' + v.text
	print '\n'
	

