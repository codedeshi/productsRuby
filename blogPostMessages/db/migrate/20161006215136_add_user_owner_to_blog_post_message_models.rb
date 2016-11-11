class AddUserOwnerToBlogPostMessageModels < ActiveRecord::Migration
  def change
    add_reference :posts :user index:true
    add_reference :messages :user index:true
  end
end
