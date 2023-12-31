class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :addresses
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  # 会員フルネーム(しばじゅん）
  def full_name
    self.last_name + self.first_name
  end
  def kana_full_name
    self.kana_last_name + self.kana_first_name
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end




end

