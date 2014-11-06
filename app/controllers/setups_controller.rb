class SetupsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @lists = $cc.get_lists(current_user.ctct_token)
  end

end
