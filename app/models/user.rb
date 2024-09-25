class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'メールアドレスは、@を含む必要があります' }
  validates :password, length: { minimum: 6 },
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'パスワードは半角英字と数字の両方を含めてください' },
                       if: -> { encrypted_password.present? }
  validates :nickname, presence: true
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角（漢字・ひらがな・カタカナ）での入力してください' }

  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）での入力してください' }
end
