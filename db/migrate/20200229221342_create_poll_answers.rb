class CreatePollAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_answers do |t|
      t.references :poll, null: false, foreign_key: true
      t.integer :answer
      t.text :textanswer

      t.timestamps
    end
  end
end
