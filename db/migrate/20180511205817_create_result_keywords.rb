class CreateResultKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :result_keywords do |t|
      t.references :keyword, foreign_key: true
      t.references :result, foreign_key: true

      t.timestamps
    end
  end
end
