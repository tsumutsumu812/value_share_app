# == Schema Information
#
# Table name: values
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_values_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Value < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    validates :title, presence:true, length: { maximum: 40 }
    validates :content, presence:true
    validates :user_id, presence:true
end
