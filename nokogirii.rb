require 'open-uri'
require 'nokogiri'

def contained_on_page?(url, advice)
  advice = advice.gsub(/\s+/, "")
  doc = Nokogiri::HTML(open(url)).inner_text.gsub(/\s+/, "")
  doc.include?(advice)
end