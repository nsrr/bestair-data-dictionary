require 'spout/tests'

def json_value(file, key)
  begin JSON.parse(File.read(file))[key.to_s] rescue nil end
end
