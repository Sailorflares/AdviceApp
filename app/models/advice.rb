class Advice < ActiveRecord::Base
  has_many :users, through: :user_advices
  has_many :user_advices

  validates_presence_of :advice_text, :url
  
  validate :contained_on_page? 

  private

  def contained_on_page?
    advice = advice_text.gsub(/\s+/, "")
    doc = Nokogiri::HTML(open(url)).inner_text.gsub(/\s+/, "")
    if !doc.include?(advice)
      errors.add(:advice_text, "Sorry, that advice doesn't seem to be in the URL you provided.")
    end
  end
end
