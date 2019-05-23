class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  
  validate :title_is_clickbait
  
  def title_is_clickbait
    clickbait_titles = ["Won't Believe", "Secret","Top/[0..9]/", "Guess"]
    if !!title
      clickbait_titles.each do |t|
        binding.pry
        if !title.include?(t)
          errors.add(:title_is_not_clickbait, "title is not clickbait-y!")
          break
        end
      end
    end
  end
  
end
