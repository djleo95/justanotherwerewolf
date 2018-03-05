class TestsController < ApplicationController
  def create
    message = Test.new content: params[:message], user_id: current_user.id
    if message.save
      ActionCable.server.broadcast "tests",
        message: message.content,
        user: message.user.nickname
      head :ok
    end
  end
end