class CreateSpecialThanks < ActiveRecord::Migration[6.0]
  def change
    create_table :special_thanks do |t|
      t.references :user , foreign_key: true
      t.references :comment , foreign_key: true
      t.timestamps
    end
  end
end
