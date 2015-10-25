class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :name
      t.string :qualification_area
      t.integer :qualification_year
      t.string :company
      t.string :location
      t.string :phone

      t.timestamps
    end
  end
end
