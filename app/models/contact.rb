class Contact < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: {minimum: 2}
    validates :phone_number, presence: true, length: {minimum: 9}
end
