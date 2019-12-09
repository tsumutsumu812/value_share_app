# == Schema Information
#
# Table name: values
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Value < ApplicationRecord
    has_many :comments
    validates :title, presence:true, length: { maximum: 40 }
    validates :content, presence:true
end
