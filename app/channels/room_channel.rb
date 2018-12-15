class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  #クライアント側のspeakアクションから渡されたパラメータをdataとして受け取りmesssageをブロードキャストする。ブロードキャスト処理は非同期通信のためにjobファイルに移動する。rails g job Broadcast

  #def speak(data)
   # ActionCable.server.broadcast 'room_channel', message: data['message']
  #end

  def speak(data)
    Message.create! content: data['message']
  end

end
