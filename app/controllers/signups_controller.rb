class SignupsController < ApplicationController
  before_filter :set_params

  def show
  end

  def create
    contact_data = {
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_addresses: [
        { email_address: params[:email] }
      ],
      lists: [
        { id: @signup_form.list_id.to_s }
      ]
    }

    token = @signup_form.user.ctct_token
    response = $cc.get_contact_by_email(token, params[:email]) rescue 'Resource not found'
    contact = ConstantContact::Components::Contact.create(contact_data)

    if response && response.respond_to?(:results) && response.results.present?
      contact.id = response.results.first.id.to_s
      $cc.update_contact(token, contact)
    else
      $cc.add_contact(token, contact)
    end

    render 'done'

  end

private

  def set_params
    @keyword = params[:keyword]
    @signup_form = SignupForm.find_by_keyword(@keyword)
  end

end
