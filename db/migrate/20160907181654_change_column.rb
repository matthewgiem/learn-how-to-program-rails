class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :lessons do |t|
      t.rename :type, :lesson_type
    end
  end
end
