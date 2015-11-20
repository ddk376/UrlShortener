class ChangeVisitJoinTable < ActiveRecord::Migration
  def change
    remove_column :visits, :submitter_id
    add_column :visits, :user_id, :integer
  end
end
