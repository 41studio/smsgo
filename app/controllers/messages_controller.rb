class MessagesController < ApplicationController
  def index
    @message = Message.new(from: '41studio Office')
  end

  def create
    @message = Message.new(message_params)
    notice = @message.save_and_return_notice
    redirect_back fallback_location: root_url, notice: notice
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :from, :body)
    end
end
