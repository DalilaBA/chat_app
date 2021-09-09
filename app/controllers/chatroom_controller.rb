class ChatroomController < ApplicationController
  before_action :require_user #this simple line will restrict the no logged in users 
  def index
    @message = Message.new
    # @messages = Message.all
    @messages = Message.custom_display

  end
end
