class AddsTheRelationshipsWeForgot < ActiveRecord::Migration
  def change
    add_reference :comments, :user, index: true
    add_reference :comments, :project, index: true

    add_reference :pledges, :user, index: true
    add_reference :pledges, :reward, index: true
    add_reference :pledges, :project, index: true

    add_reference :projects, :owner, index: true

    add_reference :rewards, :project, index: true
  end
end
