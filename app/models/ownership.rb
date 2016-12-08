class Ownership < ApplicationRecord
  # Direct associations

  belongs_to :unit

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :owner_id, :presence => true

  validates :unit_id, :presence => true

  validates :start_date, :presence => true, date: true

  validates :end_date, date: {allow_blank: true, after: :start_date, message: 'Must be after start date'}

end
