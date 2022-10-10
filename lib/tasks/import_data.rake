# frozen_string_literal: true

task import_from_csv: :environment do
  puts "Started importing data from csv"
  ARGV.each { |a| task a.to_sym do ; end }
  file_url = ARGV[0]
  RealStates::Organizers::ImportFromCsv.call(file_url: file_url)
  puts "Finished"
end
