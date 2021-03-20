class Tinyurl < ApplicationRecord
    has_many :visits
    
    validates_uniqueness_of :token, message: "This token has already been taken"
end
