class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, :store, presence: true
  validates_inclusion_of :hourly_rate, :in => 40..200

  before_create do
    self.password = random_string
  end

  private
  
  def random_string
    'password'
  end
end
