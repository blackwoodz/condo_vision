class Invoice < ApplicationRecord
  # Direct associations

  has_many   :payments,
             :dependent => :destroy

  belongs_to :unit

  belongs_to :owner,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :amount, :presence => true

  validates :amount, :numericality => { :greater_than => 0 }

  validates :assessment_type, :inclusion => { :in => [ 'monthly', ' special' ]  }

  validates :owner_id, :presence => true

  validates :status, :presence => true

  validates :status, :inclusion => { :in => [ 'Unpaid', ' Partially Paid', ' Paid In Full' ]  }

  validates :unit_id, :presence => true

end
