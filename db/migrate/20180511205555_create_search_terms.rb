class CreateSearchTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :search_terms do |t|
      t.references :keyword, foreign_key: true
      t.references :search, foreign_key: true

      t.timestamps
    end
  end
end
