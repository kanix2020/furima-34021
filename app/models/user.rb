class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
    validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
    validates :nick_name
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :last_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナで入力してください' }
    validates :birthday
  end

  has_many :items
  has_many :orders
end
