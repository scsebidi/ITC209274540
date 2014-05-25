class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
