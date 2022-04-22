# frozen_string_literal: true

require_relative "list_parser/version"
require "nokogiri"

# base Module
module ListParser
  def self.test_dir
    File.join root, "test"
  end

  class Error < StandardError; end
  # Your code goes here...

  # maps a css selector to a name
  class CssSelectorMapping
    attr_accessor :selector, :name

    def initialize(selector, name)
      @selector = selector
      @name = name
    end
  end

  # searches html data for multiple css selectors and maps
  # them each to a name
  class Processor
    attr_accessor :css_selector_mappings, :html

    def initialize(css_selector_mappings, html)
      @css_selector_mappings = css_selector_mappings
      @html = html
    end

    def call
      results = {}
      doc = Nokogiri::HTML(html)
      css_selector_mappings.each do |css_selector_mapping|
        results[css_selector_mapping.name] = []
        doc.css(css_selector_mapping.selector).each do |result|
          results[css_selector_mapping.name] << result.content
        end
      end
      results
    end
  end
end
