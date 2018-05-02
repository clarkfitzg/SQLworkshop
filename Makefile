DB = stocks.sqlite

$(DB): to_sqlite.R
	Rscript $< $@

Fortune500Locations.csv: SQLFortune500/companyLocations.R
	Rscript $<

statePopulations.csv: SQLFortune500/statePopulations.R
	Rscript $<
