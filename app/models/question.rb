class Question < ApplicationRecord
    
    has_many :answer , dependent: :destroy
    
    validates :name,presence: true
    validates :title,presence: true
    validates :content,presence: true
    
    
end
