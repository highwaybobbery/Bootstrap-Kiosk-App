class SetupsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  layout 'user_layout'

  def new
    @lists = $cc.get_lists(current_user.ctct_token)
    @signup = SignupForm.new
  end

  def create
    @signup = SignupForm.new setup_params
    @signup.save!
    reset_session
    redirect_to setup_path(keyword: @signup.keyword), notice: 'Saved!'
  rescue => e
    puts e.inspect
    @lists = $cc.get_lists(current_user.ctct_token)
    render 'new'
  end

private

  def setup_params
    params.require(:signup_form).permit(:list_id, :keyword).tap do |whitelist|
      whitelist[:user] = current_user
    end
  end

end
