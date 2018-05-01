DB = stocks.sqlite

$(DB): to_sqlite.R
	Rscript $< $@
