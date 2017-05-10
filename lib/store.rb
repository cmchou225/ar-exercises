class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, :greater_than_or_equal_to => 0}

  validate :must_sell_men_or_women_clothing, on: :create

  before_destroy :employee_check, prepend: true

  private

  def must_sell_men_or_women_clothing
     if !mens_apparel && !womens_apparel
       errors.add(:base, "must sell either mens or womens apparel")
      end
  end

  def employee_check
    if self.employees.count > 0
      throw :abort
    end
  end

end
