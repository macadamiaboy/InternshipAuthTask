class CreateSchoolclasses < ActiveRecord::Migration[7.2]
  def change
    create_table :schoolclasses do |t|
      t.string :letter
      t.integer :number
      t.integer :students_count
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
