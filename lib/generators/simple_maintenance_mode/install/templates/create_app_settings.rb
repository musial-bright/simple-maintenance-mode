class CreateAppSettings < ActiveRecord::Migration
  def change
    create_table :app_settings do |t|
      t.boolean :maintenance_mode, :default => false
      t.text :meta
      t.text :content, limit: 1.megabyte
      t.timestamps
    end
  end
end
