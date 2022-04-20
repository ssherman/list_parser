# frozen_string_literal: true

require_relative "list_parser/version"
require "nokogiri"

module ListParser
  class Error < StandardError; end
  # Your code goes here...

  class XpathMapping
    attr_accessor :xpath, :name

    def initialize(xpath, name)
      @xpath = xpath
      @name = name
    end
  end

  class Processor
    attr_accessor :xpath_mappings, :html

    def initialize(xpath_mappings, html)
      @xpath_mappings = xpath_mappings
      @html = html
    end

    def call
      results = {}
      doc = Nokogiri::HTML(html)
      xpath_mappings.each do |xpath_mapping|
        results[xpath_mapping.name] = []
        doc.css(xpath_mapping.xpath).each do |result|
          results[xpath_mapping.name] << result.content
        end
      end
      results
    end
  end
end
