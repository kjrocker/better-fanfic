class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :number
  belongs_to :story
  belongs_to :user

  def text
    object.safe_text
  end
end
