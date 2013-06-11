#!/usr/bin/make -f

SUFFIXES = .png .dia

DIA = dia
DIA_FLAGS = -s 800

PANDOC = pandoc
PANDOC_FLAGS = --smart --self-contained -t slidy

PNGS = \
	diagrams/dns_concepts.png \
	diagrams/dnstap.png \
	diagrams/passive_dns_replication.png \
	diagrams/query_logging.png \
	images/google_public_dns.png \
	images/wireshark_jj.png

all: dnstap.html

%.png : %.dia
	$(DIA) $(DIA_FLAGS) -t png -e $@ $<

dnstap.html: dnstap.txt dnstap.css $(PNGS)
	$(PANDOC) $(PANDOC_FLAGS) -c dnstap.css -s dnstap.txt -o dnstap.html

.PHONY: all dnstap.html
