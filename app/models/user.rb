class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # userに対するtweetは、1対多で紐付け
  has_many :tweets

  # userに対するcommentは、1対多で紐付け
  has_many :comments

end
