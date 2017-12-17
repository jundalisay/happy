class CreateListenings < ActiveRecord::Migration[5.1]
  def change
    create_table :listenings do |t|

      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.datetime :end

      # created_at is start
      t.timestamps
    end
  end
end
