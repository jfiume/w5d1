# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :post_subs,
    inverse_of: :post

  has_many :comments
end
