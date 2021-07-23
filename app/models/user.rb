class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で設定してください'

  with_options presence: true do
    with_options format: { with: /\A[ぁ-んァ-ヶー-龥々]+\z/, message: 'には全角文字を使用してください'  } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ , message: 'には全角カタカナを使用してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  with_options presence: true do
     validates :nickname
     validates :birthday
 end
end