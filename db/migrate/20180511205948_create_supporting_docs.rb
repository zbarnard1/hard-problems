class CreateSupportingDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :supporting_docs do |t|
      t.references :result, foreign_key: true
      t.references :synth_content, foreign_key: true

      t.timestamps
    end
  end
end
