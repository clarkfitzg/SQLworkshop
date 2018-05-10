DB = stocks.sqlite

$(DB): to_sqlite.R matchTickerLocationCompanyNames.R Fortune500Locations.csv statePopulations.csv fang.sql
	Rscript $< $@
	Rscript matchTickerLocationCompanyNames.R $@
	sqlite3 $@ < fang.sql

Fortune500Locations.csv: SQLFortune500/companyLocations.R
	Rscript $<

statePopulations.csv: SQLFortune500/statePopulations.R
	Rscript $<

%.pdf: %.tex
	latexmk -pdf $<
	latexmk -c $<

clean:
	rm $(DB)
