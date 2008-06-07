class SettingsController < ApplicationController

  def index
		@settings = Setting.find(:all, :order=>'name')
		@setting = Setting.new
  end

  def create
		Setting.create(params[:setting])
		
		redirect_to :action=>'index'
  end

  def update
		setting = Setting.find(params[:setting][:id])
		setting.update_attributes(params[:setting])
		
		redirect_to :action=>'index'
  end

  def delete
		Setting.find(params[:id]).destroy
		
		redirect_to :action=>'index'
  end
end
