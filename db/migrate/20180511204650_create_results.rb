class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :url
      t.date :date_retrieved
      t.string :body
      t.string :author
      t.date :published_on

      t.timestamps
    end
  end
end
