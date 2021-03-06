require 'active_resource'

class Person < ActiveResource::Base
  begin
    rm_settings = YAML.load_file("config/dss-rm.yml")['dssrm']

    self.site = rm_settings["endpoint"]
    self.user = rm_settings["username"]
    self.password = rm_settings["password"]
  rescue Errno::ENOENT => e
    puts "config/dss-rm.yml is missing. Please fix (see config/dss-rm.example.yml)."
  end

  # Required by declarative_authorization to determine access
  def role_symbols
    roles.map { |x| x.to_sym }
  end

  # Returns true if the given symbol is in this.role_symbols
  def has_role?(role_sym)
    role_symbols.include? role_sym
  end
end
