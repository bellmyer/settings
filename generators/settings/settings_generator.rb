class SettingsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
			# Model #
			m.file 'models/setting.rb', 'app/models/setting.rb'
			m.migration_template 'migrate/create_settings.rb', 'db/migrate'
			
			# View #
			m.directory 'app/views/settings'
			m.file 'views/settings/index.html.erb', 'app/views/settings/index.html.erb'

    	# Controller #
			m.file 'controllers/settings_controller.rb', 'app/controllers/settings_controller.rb'
			
			# Tests #
			m.file 'test/fixtures/settings.yml', 'test/fixtures/settings.yml'
			m.file 'test/functional/settings_controller_test.rb', 'test/functional/settings_controller_test.rb'
			m.file 'test/unit/setting_test.rb', 'test/unit/setting_test.rb'
			
			m.readme 'INSTALL'
		end
	end
	
	def file_name
		'create_settings'
	end
end