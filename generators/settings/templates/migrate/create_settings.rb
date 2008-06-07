class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
			t.string :name, :null=>false
			t.string :value
      t.timestamps
    end

		add_index :settings, :name
  end

  def self.down
    drop_table :settings
  end
end
