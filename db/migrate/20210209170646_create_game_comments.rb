class CreateGameComments < ActiveRecord::Migration[6.0]
  def change
    create_table :game_comments do |t|
      t.text :game_comment_text, null: false
      t.references :user , foreign_key: true
      t.references :game , foreign_key: true
      t.timestamps
    end
  end
end
