from xml.etree import ElementTree
import pprint

with open('en_product6.xml', 'rt') as f:
    tree = ElementTree.parse(f)

for node in tree.iter():
    print(node.tag)
