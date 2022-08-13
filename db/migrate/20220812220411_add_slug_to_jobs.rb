class AddSlugToJobs < ActiveRecord::Migration[6.1]
  def change
    add_index :jobs, :slug, unique: true
  end
end
