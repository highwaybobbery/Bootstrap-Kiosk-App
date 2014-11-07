class SetupsController < ApplicationController
  before_filter :authenticate_user!
  layout 'user_layout'

  def new
    @lists = $cc.get_lists(current_user.ctct_token)
    @signup = SignupForm.new
  end

  def create
    @signup = SignupForm.new setup_params
    @signup.save!
    redirect_to setup_path, notice: 'Saved!'
  rescue => e
    puts e.inspect
    @lists = $cc.get_lists(current_user.ctct_token)
    render 'new'
  end

private

  def setup_params
    params.require(:signup_form).permit(:list_id, :keyword)
  end

end
