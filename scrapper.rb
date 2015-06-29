require 'nokogiri'
require 'open-uri'

thing_to_scrap = 500
latest_thing = 881694

scrapped_things = ((latest_thing - thing_to_scrap)..latest_thing).map do |index|
  url = "http://www.thingiverse.com/thing:#{index}"
  begin
    doc = Nokogiri::HTML(open(url))
    name =  doc.at_css(".main_content .thing-header-data h1").text
    description =  doc.at_css(".thing-page-left .thing-info #description p").text
    views =  doc.at_css(".thing-page-right .thing-views .interaction-count").to_i
    downloads =  doc.at_css(".thing-page-right .thing-downloads .interaction-count").to_i
    download_link = "#{url}/zip"

    [name, description, views, downloads, download_link]
  rescue

  end

end.compact

scrapped_things = scrapped_things.compact.sort {|a,b| b[2] <=> a[2]}


File.open('scrappes.txt', 'w+') do |f|
  scrapped_things.each do |thing|
    f.conent(thing)
    f.conent('\n')
  end
end