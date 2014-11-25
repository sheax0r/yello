Dir.glob("#{__dir__}/*.rb").each do |f|
  unless f =~ /import\.rb$/ 
    require "yello/#{/((?<name>(\/.+?))+)\.rb$/.match(f)[:name]}"
  end 
end
