# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  value_id   :bigint
#
# Indexes
#
#  index_comments_on_value_id  (value_id)
#
# Foreign Keys
#
#  fk_rails_...  (value_id => "values".id)
#

class Comment < ApplicationRecord
  belongs_to :value
  validates :name, presence: true, length: {maximum: 10}
  validates :comment, presence: true, length: {maximum: 1000}
end
