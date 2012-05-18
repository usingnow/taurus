Taurus::Administrator.create(
	:id => 1,
	:email => "root@usingnow.com",
	:password => "123456",
	:status => true,
	:name => "root",
	:phone => "12345678",
  :mobile => "13012345678",
  :fax => "12345678",
  :zip_code => "100000",
  :address => "address"
)

default_path = File.join(File.dirname(__FILE__), 'default')

Rake::Task['db:load_dir'].reenable
Rake::Task['db:load_dir'].invoke(default_path)

