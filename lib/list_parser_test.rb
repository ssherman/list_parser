require 'faraday'
html = Faraday.get('https://lithub.com/the-10-best-debut-novels-of-the-decade/').body
css = '#content_wrapper > div.inner > div.inner > div > div > div.post_inner_wrapper > div > div > h5 > strong'
# author_css = '#content_wrapper > div.inner > div.inner > div > div > div.post_inner_wrapper > div > div > h5 > strong > img'
xpath_mapping = ListParser::XpathMapping.new(css, :title_and_author)
#author_xpath_mapping = ListParser::XpathMapping.new(author_css, :authors)
processor = ListParser::Processor.new([xpath_mapping], html)
processor.call

require 'faraday'
html = Faraday.get("http://www.editoreric.com/greatlit/greatest-literature.html").body
title_css = '#mainbody > div > div.work'
author_css = '#mainbody > div > div.writer'
title_xpath_mapping = ListParser::XpathMapping.new(title_css, :title)
author_xpath_mapping = ListParser::XpathMapping.new(author_css, :author)
processor = ListParser::Processor.new([title_xpath_mapping, author_xpath_mapping], html)
processor.call
