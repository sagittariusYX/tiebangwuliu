class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :organization, index: true

      t.string :name
      t.string :gender
      t.string :birthday
      t.string :phone
      t.string :email
      t.string :company

      t.timestamps
    end
  end
end
