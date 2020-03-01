class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :question
      t.text :options

      t.timestamps
    end
  end
end
