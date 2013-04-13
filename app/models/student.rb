class Student < ActiveRecord::Base
  #belongs_to :city
  #belongs_to :district
  #has_one    :student_request

  has_secure_password
  attr_accessible :email, :password, :first_name, :last_name, :phone_number, :image, :gender, :birthday, :city_id, :distirict_id, :status 
  validates_presence_of :email, :tc, :first_name, :last_name
  validates_uniqueness_of :email, :tc

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
