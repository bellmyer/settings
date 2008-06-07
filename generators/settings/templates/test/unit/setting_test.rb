require File.dirname(__FILE__) + '/../test_helper'

class SettingTest < ActiveSupport::TestCase
  def test_001_get_implicit
		assert Setting.gurgle.nil?, "Get of a non-existent setting should return nil gracefully"
		assert Setting.api == 'http://someurl.com', "api should equal 'http://someurl.com' instead of '#{Setting.api}'"
  end

	def test_002_set_implicit
		# Add a non-existent setting #
		result = (Setting.gurgle = 'choking')
		assert result, "new setting could not be saved implicitly"
		assert Setting.find_by_name('gurgle').value == 'choking', "Non-existent settings should be added to the DB automatically"

		# Update an existing setting #
		result = (Setting.api = 'http://newurl.com')
		assert result, "existing setting could not be saved implicitly"
		assert Setting.find_by_name('api').value == 'http://newurl.com', "api should equal 'http://newurl.com' instead of '#{Setting.find_by_name('api').value}'"
	end

  def test_003_get_explicit
		assert Setting.get('gurgle').nil?, "Get of a non-existent setting should return nil gracefully"
		assert Setting.get('api') == 'http://someurl.com', "api should equal 'http://someurl.com' instead of '#{Setting.get('api')}'"
  end

	def test_004_set_explicit
		# Add a non-existent setting #
		result = Setting.set('gurgle', 'choking')
		assert result, 'new setting could not be saved explicitly'
		assert Setting.find_by_name('gurgle').value == 'choking', "Non-existent settings should be added to the DB automatically"

		# Update an existing setting #
		result = Setting.set('api', 'http://newurl.com')
		assert result, 'existing setting could not be saved explicitly'
		assert Setting.find_by_name('api').value == 'http://newurl.com', "api should equal 'http://newurl.com' instead of '#{Setting.find_by_name('api').value}'"
	end
end
