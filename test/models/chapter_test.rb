require 'test_helper'

class ChapterTest < ActiveSupport::TestCase
  CHARACTER_SETS = {
    'Cyrillic' => "Лорем ипсум долор сит амет",
    'Greek' => "Λορεμ ιπσθμ δολορ σιτ αμετ",
    'Armenian' => "լոռեմ իպսում դոլոռ սիթ ամեթ",
    'Japanese' => "全れねぱ本58義ゅ疑新そーろす関表ナハ",
    'Chinese' => "禁拡車茶山紆形本条介待学来稿"
  }

  test "processes safe_text" do
    chapter = create(:chapter)
    assert chapter.safe_text.present?
  end

  test "raw_text is 1 for 1 representation of textarea" do
    unsafe_text = <<~HEREDOC
      **strong** _emphasis_ <script>alert('Hello World!');</script> SELECT * FROM USERS;
    HEREDOC
    chapter = create(:chapter, raw_text: unsafe_text)
    assert_equal chapter.raw_text, unsafe_text
    refute_equal chapter.safe_text, unsafe_text
  end

  test "safe_text parses emphasis" do
    chapter = create(:chapter, raw_text: "_emphasized text_")
    assert_includes chapter.safe_text, "<em>emphasized text</em>"
  end

  test "safe_text parses strong" do
    chapter = create(:chapter, raw_text: "**strong text**")
    assert_includes chapter.safe_text, "<strong>strong text</strong>"
  end

  test "safe_text removes HTML tags" do
    chapter = create(:chapter, raw_text: "<strong>strong text</strong>")
    refute_includes chapter.safe_text, "<strong>"
  end

  test "safe_text removes script tags" do
    chapter = create(:chapter, raw_text: "<script>alert('Hello World!')</script>")
    refute_includes chapter.safe_text, "<script>"
  end

  CHARACTER_SETS.each do |k, v|
    test "chapters process #{k} characters" do
      chapter = create(:chapter, raw_text: v)
      assert_includes chapter.safe_text, v
    end
  end
end
