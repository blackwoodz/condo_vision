class Ownership < ApplicationRecord
  # Direct associations

  belongs_to :unit

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :dues_delinquent, :presence => true

  validates :end_date, :numericality => { :greater_than_or_equal_to => 0 }

  validates :owner_id, :presence => true

  validates :recurring_payments_on, :presence => true

  validates :start_date, :presence => true

  validates :start_date, :numericality => { :greater_than_or_equal_to => 0 }

  validates :unit_id, :presence => true

end
