class Tenancy < ApplicationRecord
  # Direct associations

  belongs_to :unit

  belongs_to :tenant,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :end_date, :numericality => { :greater_than_or_equal_to => 0 }

  validates :start_date, :presence => true

  validates :start_date, :numericality => { :greater_than_or_equal_to => 0 }

  validates :tenant_id, :presence => true

  validates :unit_id, :presence => true

end
