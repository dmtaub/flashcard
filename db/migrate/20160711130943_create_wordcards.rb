class CreateWordcards < ActiveRecord::Migration[5.0]
  def change
    create_table :wordcards do |t|
      t.string :word
      t.text :definition

      t.integer :bin, default: 0
      t.integer :times_wrong, default: 0

	    t.column :reviewed_at, :datetime, default: nil

      t.timestamps
    end
  end
end
