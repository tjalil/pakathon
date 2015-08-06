class Admin < ActiveRecord::Base
  
  authenticates_with_sorcery! do |config|
    config.authentication_class = Authentication
  end

  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_one :city
  has_many :resources

  def my_city
    City.find_by(admin_id: Admin.find(self).id)
  end

end