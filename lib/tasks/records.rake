desc "Pick a random prize and winner"
task :all => [:import_santa_cruz, :import_north_bay, :import_peninsula, :import_east_bay, :import_south_bay, :import_san_francisco]

def craigslist_harvester(location)
  # instantiates mechanize, gets desired url and extracts data
  require 'mechanize'
  agent = Mechanize.new
  agent.get("http://sfbay.craigslist.org/#{location}/laf/")
  agent.page.search(".row").each do |item|
  
    # checks to see if lost item is animal related
    lost_animal=  %w{cat kitten kitty tabby siamese dog doggy puppy pup hound terrier spaniel akita bulldog cocker foxhound fox pit bull pitbull shepherd pointer pinscher basset beagle collie coonhound bloodhound bolognese boxer bullmastiff mastiff sheepdog retriever chihuahua chinook chowchow chow wolfdog doberman siberian setter spitz dane harehound greyhound wolfhound russell jindo labrador lab heeler whippet maltese watchdog otterhound pekingese ridgeback pomeranian poodle pug rottweiler laika schnauzer deerhound sleddog sharpei shar pei shih tzu shihtzu windhound bernard staffordshire bangkaew manchester weimaraner corgi yorkshire yorkie}
    if lost_animal.any? { |w| item.text.downcase =~ /#{w}/ } == true
      # creates date for each item
      year = Date.today.strftime("%Y")
      month = Date::ABBR_MONTHNAMES.index(item.text[4..6])
      day = item.text[/\d+/]
      date = Date.strptime("{ #{year}, #{month}, #{day} }", "{ %Y, %m, %d }")
    
      # assigns location
      location = "#{location}"
      
      # saves to database if new
      Record.where(:title => item.text, :date => date, :location => location).first_or_create
    end
  end
end


desc "Importing santa cruz"
task :import_santa_cruz => :environment do
  craigslist_harvester("scz")
end

desc "importing north bay"
task :import_north_bay => :environment do
  craigslist_harvester("nby")
end

desc "importing peninsula"
task :import_peninsula => :environment do
  craigslist_harvester("pen")
end

desc "importing east bay"
task :import_east_bay => :environment do
  craigslist_harvester("eby")
end

desc "importing south bay"
task :import_south_bay => :environment do
  craigslist_harvester("sby")
end

desc "importing san francisco"
task :import_san_francisco => :environment do
  craigslist_harvester("sfc")
end

