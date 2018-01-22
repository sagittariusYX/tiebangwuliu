class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.belongs_to :organization, index: true
      t.string :email

      t.timestamps
    end
  end
end
