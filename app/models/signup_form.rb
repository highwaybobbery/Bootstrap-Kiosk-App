class SignupForm < ActiveRecord::Base
  belongs_to :user
  validates :list_id, :keyword, presence: true
end
