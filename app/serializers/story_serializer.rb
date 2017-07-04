class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :chapter_count, :author, :chapter_numbers
  has_many :chapters
  belongs_to :user

  def chapter_count
    object.chapters.length
  end

  def chapter_numbers
    object.chapters.map(&:number).sort
  end

  def author
    object.user.email
  end
end
