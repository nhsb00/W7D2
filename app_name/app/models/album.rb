class Album < ApplicationRecord
   validates :band, :name, :year, presence: true

   belongs_to :band

end