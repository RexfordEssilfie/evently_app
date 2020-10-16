class Event < ApplicationRecord
    belongs_to :user, :class_name => "User"
    validates :name, presence: true, length: { maximum: 60}
    validates :description, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :location, presence: true
    validates :visibility, presence: true
end
