class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.references :topic, foreign_key: true
      t.date :date_searched

      t.timestamps
    end
  end
end
