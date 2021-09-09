class ChatroomController < ApplicationController
  before_action :require_user #this simple line will restrict the no logged in users 
  def index
    @messages = Message.all
  end
end
