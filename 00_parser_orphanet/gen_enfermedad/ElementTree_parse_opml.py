from xml.etree import ElementTree

with open('en_product6.xml', 'rt') as f:
    tree = ElementTree.parse(f)

print(tree)
