class Story < ApplicationRecord
  belongs_to :user
  has_many :chapters

  def ordered_chapters
    chapters.order(number: :asc)
  end
end
