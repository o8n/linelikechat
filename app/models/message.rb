class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
end

#messageテーブルにデータがcreateされた後にmessageBroadcastのperformアクションを実行する。

#そしてroom_channel.rbで定義したspeakアクションから送信されるdata、selfを利用してmessageモデルとして渡す。

#最後にクライアント側でのreceiveの処理を変更してviewにappendする
