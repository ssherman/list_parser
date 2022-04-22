# frozen_string_literal: true

require "test_helper"

# tests
class TestListParser < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ListParser::VERSION
  end

  def test_html1
    html1 = File.read(File.join(File.dirname(__FILE__), "data", "html1.html"))
    css = "#content_wrapper > div.inner > div.inner > div > div > div.post_inner_wrapper > div > div > h5 > strong"
    title_and_author_mapping = ListParser::CssSelectorMapping.new(css, :title_and_author)
    processor = ListParser::Processor.new([title_and_author_mapping], html1)
    results = processor.call
    puts results.inspect
    assert !results.nil?
    assert_equal results[:title_and_author].count, 20
  end

  def test_html2
    html2 = File.read(File.join(File.dirname(__FILE__), "data", "html2.html"))
    title_css = "#mainbody > div > div.work"
    author_css = "#mainbody > div > div.writer"
    title_mapping = ListParser::CssSelectorMapping.new(title_css, :title)
    author_mapping = ListParser::CssSelectorMapping.new(author_css, :author)
    processor = ListParser::Processor.new([title_mapping, author_mapping], html2)
    results = processor.call

    assert !results.nil?
    assert_equal results[:title].count, 999
    assert_equal results[:author].count, 999
  end
end
