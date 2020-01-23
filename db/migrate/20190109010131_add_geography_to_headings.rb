class AddGeographyToHeadings < ActiveRecord::Migration[5.0]
  def change
    add_reference :budget_headings, :geography, index: true, foreign_key: true
  end
end
