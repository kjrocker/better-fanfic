class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :story

  before_save :sanitize_text

  def sanitize_text
    self.safe_text = Renderer.call(self.raw_text)
  end
end
