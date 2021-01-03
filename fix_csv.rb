require "csv"
require "date"

csv = []
csv << ["time", "temp", "in_oven"]
CSV.open(ARGV[0], headers: true).each do |row|
  if row["time"] < "2020-12-25 13:55:33"
    csv << [row["time"], row["temp_1"], "T"]
  else
    if row["temp_2"] == "320"
      csv << [row["time"], row["temp_1"], "F"]
    else
      csv << [row["time"], row["temp_1"], "T"]
    end
  end
end

File.open(ARGV[0], "w") do |f|
  c = CSV.new(f)
  csv.each { |row| c << row }
end
