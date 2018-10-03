class Song < ApplicationRecord

has_many :notes, dependent: :destroy
validates_presence_of :title, :created_by
end
