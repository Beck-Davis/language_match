### Match language codes
require 'marc'
require 'nokogiri'

#create a new hash to map the ISO 639-3 languages and codes
name_to_code = {} 
File.open('iso-639-3_20230123.tab', "r") do |input|
  input.gets
  while line = input.gets
    line.chomp!
    columns = line.split("\t")
    language = columns[6]
    code = columns[0]
    name_to_code[language] = code
  end
end

output = File.open('sample_algonquian_other.tsv', "w")

#find matches
def match_language_names(reader, name_to_code, output)
  reader.each do |record|
    mmsid = record['001'].value
      
    record.fields('546').each do |field| #iterate over the 546 field
      matched_codes = [] # Collect matched ISO codes for this field

      field.subfields.each do |subfield| #iterate over the 546 subfields
        name_to_code.each do |language, iso_code| # iterates over the iso codes and languages
          if subfield.value =~ /#{language}[\s\.\;\,]/ && !matched_codes.include?(iso_code) #regex to match language names within the subfield value string
            matched_codes << iso_code
            puts "Matched: #{language} => #{iso_code} in MMSID #{mmsid}"
          end
        end
      end
      output.puts"#{mmsid}\t#{field['a']}\t#{matched_codes.join(',')}"
    end
  end       
end

Dir.glob('sample_algonquian_other.marcxml').each do |file|
  puts File.basename(file)
  reader = MARC::XMLReader.new(file, parser:'magic', ignore_namespace: true)
  match_language_names(reader, name_to_code, output)
end