class SignupForm < ActiveRecord::Base
  validates :list_id, :keyword, presence: true
end
