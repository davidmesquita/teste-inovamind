class QuoteSerializer
  include ActiveModel::Serialization

  attr_accessor :quote, :author, :author_about, :tags

  def initialize(xml_doc)
    self.quote = xml_doc.css('span.text').text
    self.author = xml_doc.css('small').text
    self.author_about = xml_doc.css('a').first["href"]
    self.tags = extract_tags(xml_doc)
  end

  def attributes
    {quote: quote, author: author, author_about: author_about, tags: tags}
  end

  private

  def extract_tags(xml_doc)
    xml_doc.css('a').to_a.drop(2).map{ |a_tag| a_tag.text }
  end
end