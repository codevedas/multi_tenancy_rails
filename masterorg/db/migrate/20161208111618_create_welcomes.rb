class CreateWelcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :welcomes do |t|
      t.string :domain
      t.string :path

      t.timestamps
    end
  end
end
