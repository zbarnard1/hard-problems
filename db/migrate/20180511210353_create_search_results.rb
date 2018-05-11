class CreateSearchResults < ActiveRecord::Migration[5.2]
  def change
    create_table :search_results do |t|
      t.references :search, foreign_key: true
      t.references :result, foreign_key: true
      t.boolean :keep

      t.timestamps
    end
  end
end
