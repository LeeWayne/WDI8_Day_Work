require 'pry-byebug'
require 'pg'

db = PG.connect(:dbname =>'facebook_app', :host => 'localhost')
begin
  db.exec( "select * from people" ) do |result|
    puts 'Your current friends are: '
    result.each do |row|
      # do stuff
      puts "#{row['id']}: #{row['first']} #{row['last']}"
    end
  end

  puts
  puts "Create a new friend: (or ctrl-c to quit):"
  print "name:"
  name = gets.chomp
  firstname, lastname = name.split(" ")

  print "relationship: "
  relationship = gets.chomp

  print "date of birth: "
  dob = gets.chomp

  print "city: "
  city = gets.chomp

  
  sql = "insert into people (first, last, relationship, dob, city) values ('#{firstname}','#{lastname}', '#{relationship}', '#{dob}', '#{city}')"

  db.exec(sql)

ensure
  db.close
end