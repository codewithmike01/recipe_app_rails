class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :food, dependent: :destroy
  has_many :recipe, dependent: :destroy

  # authorization Roles
  Roles = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
