class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :shortened_url_id, unique: true
      t.integer :submitter_id

      t.timestamps
    end

    add_index :visits, :submitter_id
    add_index :visits, :shortened_url_id
  end

end
