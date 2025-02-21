class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname

      t.belongs_to :schoolclass, null: false, foreign_key: true
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
