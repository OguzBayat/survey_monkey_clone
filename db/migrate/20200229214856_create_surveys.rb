class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.text :title
      t.boolean :closed
      t.date :end_date

      t.timestamps
    end
  end
end
