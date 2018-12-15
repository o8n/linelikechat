class RoomsController < ApplicationController
  before_action :signed_in_required, only: [:show]

  def show
    @messages = Message.all
  end
end
