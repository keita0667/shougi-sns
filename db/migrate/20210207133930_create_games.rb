class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.datetime :game_date, default: -> { 'NOW()' }
      t.integer :zoom
      t.string :game_app
      t.integer :kiryoku_id, null: false
      t.text :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
