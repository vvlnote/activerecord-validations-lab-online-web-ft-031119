class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  
  validate :title_is_clickbait
  
  def title_is_clickbait
    clickbait_titles = ["Won't Believe", "Secret","Top/[0..9]/", "Guess"]
    if !!title
      is_clickbait = false
      for i in 0..clickbait_titles.length do
        if title.include?(clickbait_titles[i])
          is_clickbait = true
          break
        end
      end
      if !is_clickbait
        errors
      end
    end
  end
  
end
