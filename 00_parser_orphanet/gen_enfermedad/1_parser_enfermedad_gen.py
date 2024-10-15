
import xml.etree.ElementTree as ET
tree = ET.parse('/mnt/lustre/scratch/CBRA/projects/cov_rd/data/00_parser_orphanet/gen_enfermedad/en_product6.xml')
root = tree.getroot()

root_1 = root[1]

for child in root_1:
	print(child.tag, child.attrib)
	
for neighbor in root_1.iter('Disorder'):
	print(neighbor.attrib)
	
	
my_list_name = []
my_list_symbol = []
	
for country in root_1.findall('Disorder'):
	 #rank = country.find('OrphaCode').text
	 name = country.find('Name').text
	 o = country.find('DisorderGeneAssociationList')
	 m = o
	 n = m.find('DisorderGeneAssociation')
	 p = n.find('Gene')
	 symbol = p.find('Symbol').text
	 my_list_name.append(name)
	 my_list_symbol.append(symbol)
	 print(name, symbol)
	 
        
with open('/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/list_name.txt', 'w') as filehandle:
	for listitem in my_list_name:
		filehandle.write('%s\n' % listitem.encode(encoding='UTF-8',errors='strict'))   
	 
	 
with open('/mnt/lustre/scratch/CBRA/projects/cov_rd/results/00_parser_orphanet/gen_enfermedad/list_symbol.txt', 'w') as filehandle:
	for listitem in my_list_symbol:
		filehandle.write('%s\n' % listitem.encode(encoding='UTF-8',errors='strict'))   
	 	 
	 
