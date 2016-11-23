class Unit < ApplicationRecord
  # Direct associations

  has_many   :invoices,
             :dependent => :destroy

  has_one    :tenancy,
             :dependent => :destroy

  has_one    :ownership,
             :dependent => :destroy

  # Indirect associations

  has_one    :tenant,
             :through => :tenancy,
             :source => :tenant

  has_one    :owner,
             :through => :ownership,
             :source => :owner

  # Validations

  validates :monthly_dues, :presence => true

  validates :monthly_dues, :numericality => { :greater_than => 0, :less_than_or_equal_to => 1000 }

  validates :unit_number, :uniqueness => true

  validates :unit_number, :presence => true

end
