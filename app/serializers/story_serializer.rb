class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :chapter_count
  has_many :chapters
  belongs_to :user

  def chapter_count
    object.chapters.count
  end

  class ChapterSerializer < ActiveModel::Serializer
    attributes :id, :number
  end
end
