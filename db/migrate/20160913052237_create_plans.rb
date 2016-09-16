class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
