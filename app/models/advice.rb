  require 'open-uri'

class Advice < ActiveRecord::Base
  has_many :user_advices
  has_many :users, through: :user_advices

  acts_as_taggable

  validates_presence_of :url#, :tag_list
  
  validate :check_url
  
  #after_validation :update_advice_title, if: :url_changed?#check if I can take away this condition
    
  
  def update_advice_title
    Rails.logger.info "<================ After save, url changed: #{self.url_changed?} ===============>"
    @doc = Nokogiri::HTML(open(self.url))
    header = @doc.css('h1').text
    self.update_attribute(:title, header)
  end

  def ratio(id)#bad name. Clearly a setter. Names should be descriptive. Always.
    total = UserAdvice.where(:advice_id => id).count
    upvotes = UserAdvice.where(:advice_id => id, :upvote => true).count
    "#{upvotes}/#{total} (#{(upvotes.to_f/total).round(2) * 100}%)"
  end

  private

  def check_url
    Rails.logger.info "<================ Checking URL: #{url} ===============>"
    uri = URI.parse(url)
    if !uri.kind_of?(URI::HTTP) || URI::InvalidURIError#changed from RESCUE that error, return false
      errors.add(:url, "Sorry, not  valid URL")
    end  
  end

  # def contained_on_page?
  #   advice = advice_text.gsub(/\s+/, "")
  #   doc = Nokogiri::HTML(open(url)).inner_text.gsub(/\s+/, "")
  #   if !doc.include?(advice)
  #     errors.add(:advice_text, "Sorry, that advice doesn't seem to be in the URL you provided.")
  #   end
  # end

end
