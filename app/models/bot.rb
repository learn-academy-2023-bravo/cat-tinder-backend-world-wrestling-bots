class Bot < ApplicationRecord
    validates :name, :age, :weight, :enjoys, :image, presence: true
    validates :enjoys, length: { minimum: 10 }
  end
