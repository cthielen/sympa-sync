load 'models/application.rb'
load 'models/person.rb'
require 'pp'

# Fake Sympa lists (to be replaced with Sympa API calls later)
sympa_lists = ['history-staff', 'history-fac', 'dssit-devs', 'econ-all']
cached_sympa_lists = {} # used to add additional properties, e.g. 'touched'

# Get a list of all applications
applications = Application.all

pp applications

abort

# Go through each application and sync with the lists
applications.each do |application|
  puts application.name
  if sympa_lists.include? application.name
    puts "found in list"
  else
    puts "not found in list"
  end
end

# Check to see if any lists weren't synced (new lists)
