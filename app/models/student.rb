class Student < ActiveRecord::Base
  #belongs_to :city
  #belongs_to :district
  #has_one    :student_request

  has_secure_password

  validates_presence_of :email, :tc, :first_name, :last_name
  validates_uniqueness_of :email, :tc

  #def self.authenticate(email, password)
  #  find_by_email(email).try(:authenticate, password)
  #end

  def self.get_fullname id
    if id
      student = Student.find(:first, :conditions => {:id => id})
      "#{student[:first_name]} #{student[:last_name]}" if student
    end
  end

  def self.sfind(id)
    Search.new({
      :institute_id => id,
      #:city_id => city_id,
      #:district_id => district_id
    }).save

    query = {}
  end

end
