class Book < ApplicationRecord
   belongs_to :user
   validates :title, presence: true
   validates :body, presence: true
   validates :body, length: { maximum: 200,
   
    too_long: "Body is too long (maximum is  characters)" }
end
