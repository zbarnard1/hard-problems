class AddPageIdToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :page_id, :string
  end
end
