class District < ActiveRecord::Base
  has_one  :dealers
  has_one  :users

  def self.get_name id
    if id
      district = District.find(:first, :conditions => {:id => id})
      district[:district] if district
    end
  end

end
