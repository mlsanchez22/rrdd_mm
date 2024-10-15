from xml.etree import ElementTree

with open('en_product6.xml', 'rt') as f:
    tree = ElementTree.parse(f)

for node in tree.iter('Name'):
    print(node)
