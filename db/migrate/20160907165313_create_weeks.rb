class CreateWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :weeks do |t|
      t.column :name, :string
      t.column :course_id, :integer

      t.timestamps
    end
  end
end
