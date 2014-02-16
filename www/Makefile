EMACS=emacs
ORG_CONFIG_FILE=publish_config.el
EMACS_OPTS=--batch --eval "(load-file \"$(ORG_CONFIG_FILE)\")" -f myweb-publish

DEST_HOST='ysuma0@ysumathstat.org:public_html/faculty/kerns2/'
OUTPUT_DIR=output

all: html upload

html:
	@echo "Generating HTML..."
	@mkdir -p $(OUTPUT_DIR)
	emacs -Q -batch -eval "(progn (load \"~/gitm/ipsurweb/publish_config.el\") (org-publish \"ipsurweb\"))"
	@echo "HTML generation done"
	-rm -r ~/.org-timestamps

upload: clean_bak

	@cd $(OUTPUT_DIR) && scp -r . $(DEST_HOST) && cd ..

clean_all: clean_output clean_bak

clean:
	@rm -rf $(OUTPUT_DIR)

clean_bak:
	@find . | grep ~$$ | while read l; do rm $$l; done
