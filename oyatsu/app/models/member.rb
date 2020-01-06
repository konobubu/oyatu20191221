class Member < ApplicationRecord
  has_secure_password #属性 :password :password_confirmation を定義
  has_many :entries, dependent: :destroy #会員はブログ記事をたくさん持つ
  
  validates :name, {
    presence: true,
    format: {
      with: /\A[A-Za-z][A-Za-z0-9]*\z/,
      allow_blank: true,
      message: :invalid_member_name
    },
    length: { minimum: 2, maximum: 20, allow_blank: true }, #2文字以上20文字以下で
    uniqueness: { case_sensitive: false } #大文字小文字は区別しない
  }

  validates :full_name, { presence: true, length: { maximum: 20 } }
  validates :gender, { presence: true }
  validates :email, email: { allow_blank: true } #gemパッケージemail_validatorを使用

  attr_accessor :current_passworは
  validate :password, { if: :current_password } #新規登録のみ発動するため

  class << self
      def search(query)
        rel = order("id")
          if query.present?
            rel = rel.where("name LIKE ? OR full_name LIKE ?",
            "%#{query}%", "%#{query}%")
          end
        rel
      end
  end
end
