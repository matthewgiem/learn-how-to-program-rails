class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :day, :string
      t.column :type, :string
      t.column :week_id, :integer

      t.timestamps
    end
  end
end
