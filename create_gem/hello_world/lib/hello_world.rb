require "hello_world/version"
require 'yaml'

module HelloWorld

  def self.say_hello(language=nil, name=nil)
    raise "You need to give me a language" unless language
    name = ",#{name}" if name
    "#{hash}[language]#{name}"
  end

  def self.random
    key = hash.keys.sample
    hash.assoc key
  end
  
  def self.hash
    path = File.expand_path("../../resources/hello.yml", __FILE__)

    @@hello_hash ||= YAML.load_file(path)

    @@hello_hash[:hello]

  end

end
