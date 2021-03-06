class Payment < ApplicationRecord
  # Direct associations

  belongs_to :invoice

  # Indirect associations

  has_one    :payer,
             :through => :invoice,
             :source => :owner

  # Validations

  validates :amount, :presence => true

  validates :amount, :numericality => { :greater_than => 0 }

end
