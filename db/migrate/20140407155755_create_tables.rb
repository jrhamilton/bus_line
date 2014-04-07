class CreateTables < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
    end

    create_table :stations do |t|
      t.string :name
    end

    create_table :stops do |t|
      t.belongs_to :line
      t.belongs_to :station
      t.time :stop_time
    end
  end
end
