class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :client
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
