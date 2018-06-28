class RefactorResultsTable < ActiveRecord::Migration[5.2]
  def change
    change_table :results do |t|
      t.remove :body, :date_retrieved
      t.string :snippet
      t.string :title
      t.string :abstract
      t.string :full_text
      t.references :search
    end
  end
end

