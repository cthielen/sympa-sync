load 'models/application.rb'
load 'models/person.rb'
require 'pp'

# Fake Sympa lists (to be replaced with Sympa API calls later)
sympa_lists = {'history-staff' => {:touched => false}, 'history-fac' => {:touched => false}, 'dssit-devs' => {:touched => false}, 'econ-all' => {:touched => false}}

# Get a list of all applications
applications = Application.all

puts "Existing applications:"

# Go through each application and sync with the lists
applications.each do |application|
  puts application.name
  if sympa_lists.include? application.name
    puts "found in list"
  else
    puts "not found in list"
  end
end

puts "New lists:"

# Check to see if any lists weren't synced (new lists)
sympa_lists.reject{|key,value| value[:touched] == true }.each do |new_list|

end
