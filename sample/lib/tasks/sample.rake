require 'ffaker'

namespace :taurus_sample do
  desc 'Loads sample data'
  task :load do
    sample_path = File.join(File.dirname(__FILE__), '..', '..', 'db', 'sample')
     
    Rake::Task['db:load_dir'].reenable
    Rake::Task['db:load_dir'].invoke(sample_path)
  end

  desc "export sample data"
	task :export, [:model_name] => :environment do |t, args|
    File.open("#{Rails.root}/#{args.model_name.pluralize}.yml", 'w') { |f|  
    	eval("Taurus::#{args.model_name.camelcase}.all").each do |object|
      	f.puts "#{args.model_name}_#{object.id}:" 
      	object.attributes.keys.each do |key|
          f.puts "  #{key}: '#{object.send(key)}'" unless ["created_at", "updated_at"].member?(key)
      	end
    	end
    }
	end
end
