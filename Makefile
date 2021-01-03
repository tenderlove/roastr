JQ=jq
RUBY=ruby
RSCRIPT=Rscript

%.png: %.csv
	Rscript roast.R $< $@

%.csv: %.json
	echo "time,temp_1,temp_2" > $@
	$(JQ) -r '[.time, .temperature_1_C, .temperature_2_C] | @csv' $< >> $@
	$(RUBY) fix_csv.rb $@

reheat-roast.csv: reheat-roast.json
	jq -r '[.time, .temperature_1_C] | @csv' reheat-roast.json > reheat-roast.csv
