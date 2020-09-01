class Comment < ApplicationRecord

  # commentに対するuserは、1対1で紐付け
  belongs_to :user

  # commentに対するtweetは、1対1で紐付け
  belongs_to :tweet

end
