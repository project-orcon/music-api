class Note < ApplicationRecord
  belongs_to :song

  #validate

  validates_presence_of :name
end
