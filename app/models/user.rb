class User < ApplicationRecord
  require 'bcrypt'

  before_save :hash_password

  private

  def hash_password
    # すでにハッシュ化されていない場合のみ変換
    if pass.present? && pass !~ /^\$2[aby]\$/
      self.pass = BCrypt::Password.create(pass)
    end
  end
end
