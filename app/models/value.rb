class Value < ApplicationRecord
    validates :title, presence:true, length: { maximum: 40 }
    validates :content, presence:true
end
