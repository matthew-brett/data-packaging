# Makefile for data

SF_USER ?= matthewbrett
WWW = $(SF_USER),nipy@web.sourceforge.net:htdocs/data-packages/

.PHONY: help clean clean_templates clean_data all 
help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  templates      make nipy-templates package"
	@echo "  data           make nipy-data package"
	@echo "  clean          clean existing builds of the packages"


clean: clean_templates clean_data

clean_templates:
	-rm -rf nipy-templates/dist

clean_data:
	-rm -rf nipy-data/dist

all: templates data

templates: clean_templates
	python scripts/validata_data_pkg.py nipy-templates

data: clean_data
	python scripts/validata_data_pkg.py nipy-data

publish_templates: 
	rsync -avH nipy-templates/dist/*.tar.gz $(WWW)

publish_data:
	rsync -avH nipy-data/dist/*.tar.gz $(WWW)
