class Advice < ActiveRecord::Base
  has_many :user_advices
  has_many :users, through: :user_advices

  acts_as_taggable

  validates_presence_of :url, :tag_list
  
  #validate :valid?

  def posts_new_advice(url)
    advice = Advice.find_or_create_by(url: url)
  end

  def url_title
    Nokogiri::HTML(open(self.url)).css('title').children.text
  end

  def url_valid?
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end

  private

  def contained_on_page?
    advice = advice_text.gsub(/\s+/, "")
    doc = Nokogiri::HTML(open(url)).inner_text.gsub(/\s+/, "")
    if !doc.include?(advice)
      errors.add(:advice_text, "Sorry, that advice doesn't seem to be in the URL you provided.")
    end
  end
end
