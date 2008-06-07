require File.dirname(__FILE__) + '/../test_helper'

class SettingsControllerTest < ActionController::TestCase
  def test_001_index
    get :index
		assert_select "td[id=setting_1]", 1, "Should display setting id 1"
  end
	
	def test_002_create
		get :create, :setting=>{:name=>'this', :value=>'that'}
		assert_redirected_to :action=>'index'
		assert_equal Setting.this, 'that', "setting 'this' should equal 'that'"
	end
	
	def test_003_update
		api = settings(:api)
		
		get :update, :setting=>{:id=>api.id, :value=>'turkey'}
		assert_redirected_to :action=>'index'
		assert_equal Setting.api, 'turkey', "api should be turkey"
	end
	
	def test_004_delete
		api = settings(:api)
		
		get :delete, :id=>api.id
		assert_redirected_to :action=>'index'
		assert Setting.api.nil?, "api should be nil"
	end
end
