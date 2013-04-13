class AddPasswordDigestToStudents < ActiveRecord::Migration
  def change
    add_column :students, :password_digest, :string
  end
  def down
    remove_column :students, :password
  end
end
