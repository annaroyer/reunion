require 'erb'
require './lib/activity'
require './lib/reunion.rb'

reunion = Reunion.new('Hawaii')

hiking = Activity.new('hiking')
hiking.add_participant('William', 0.00)
hiking.add_participant('Sylvia', 0.00)
hiking.add_participant('Lucia', 0.00)
hiking.add_participant('Isabella', 0.00)

skating = Activity.new('roller_skating')
skating.add_participant('William', 20.00)
skating.add_participant('Sylvia', 13.00)
skating.add_participant('Lucia', 7.00)
skating.add_participant('Isabella', 0.00)

swimming = Activity.new('swimmming')
swimming.add_participant('William', 0.00)
swimming.add_participant('Sylvia', 0.00)
swimming.add_participant('Lucia', 0.00)
swimming.add_participant('Isabella', 21.00)

reunion.add_activity(hiking)
reunion.add_activity(skating)
reunion.add_activity(swimming)

template_letter = File.read './data/reunion.erb'
erb_template = ERB.new template_letter

reunion_letter = erb_template.result(binding)

Dir.mkdir("reunions") unless Dir.exists?("reunions")

filename = "reunions/reunion.html"

File.open(filename, 'w') do |file|
  file.puts reunion_letter
end
