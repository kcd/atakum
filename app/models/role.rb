class Role < ActiveRecord::Base
  has_one  :institute

  def self.get_name id
    if id
      role = Role.find(:first, :conditions => {:id => id})
      role[:name] if role
    end
  end

end
