class City < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one  :student
  has_one  :institute

  def self.get_name id
    if id
      city = City.find(:first, :conditions => {:id => id})
      city[:city] if city
    end
  end
end
