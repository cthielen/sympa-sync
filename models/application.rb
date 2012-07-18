require 'active_resource'

class Application < ActiveResource::Base
  begin
    rm_settings = YAML.load_file("config/dss-rm.yml")['dssrm']

    self.site = rm_settings["endpoint"]
    self.user = rm_settings["username"]
    self.password = rm_settings["password"]
  rescue Errno::ENOENT => e
    puts "config/dss-rm.yml is missing. Please fix (see config/dss-rm.example.yml)."
  end
end
