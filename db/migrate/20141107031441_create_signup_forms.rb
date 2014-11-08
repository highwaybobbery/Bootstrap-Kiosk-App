class CreateSignupForms < ActiveRecord::Migration
  def change
    create_table :signup_forms do |t|
      t.integer :account_id
      t.integer :list_id
      t.string :keyword
      t.integer :user_id

      t.timestamps
    end
  end
end
