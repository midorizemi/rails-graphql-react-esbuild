class AddOwnerIdToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :owner_id, :integer
  end
end
