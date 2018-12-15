class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
    # Do something later
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'message/message', locals: {message: message})
    end
end

#speakアクションからjobファイルに移動してブロードキャストの処理を書く
#_message.html.erb fileにmessageを渡し、代入したものを再びmessageに代入する
#そのあとmessageモデルを編集
