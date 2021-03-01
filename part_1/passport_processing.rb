# Passport data is validated in batch files (your puzzle input). Each passport is represented as a sequence of key:value pairs separated by spaces or newlines.
# Passports are separated by blank lines.
#byr (Birth Year)
#iyr (Issue Year)
#eyr (Expiration Year)
#hgt (Height)
#hcl (Hair Color)
#ecl (Eye Color)
#pid (Passport ID)
#cid (Country ID)
# Count the number of valid passports - those that have all required fields. Treat cid as optional.

require 'csv'
require_relative './lib/passport_organizer.rb'

puts 'Passport Processing'

file = File.read('./../data/passports.txt')
csv = CSV.parse(file)

pass_valid = PassportOrganizer.new(csv).verification

puts("O total de passaportes validos é: #{pass_valid}")
