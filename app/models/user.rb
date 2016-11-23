class User < ApplicationRecord
  # Direct associations

  has_many   :invoices,
             :foreign_key => "owner_id",
             :dependent => :destroy

  has_many   :tenancies,
             :foreign_key => "tenant_id",
             :dependent => :destroy

  has_many   :ownerships,
             :foreign_key => "owner_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :occupied_units,
             :through => :tenancies,
             :source => :unit

  has_many   :payments,
             :through => :invoices,
             :source => :payments

  has_many   :owned_units,
             :through => :ownerships,
             :source => :unit

  # Validations

  validates :contact_phone_number, :presence => true

  validates :current_board_member

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :site_admin

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
