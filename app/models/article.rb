class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # Validations: http://guides.rubyonrails.org/active_record_validations.html
  validates :title, presence: true,
                    length: {minimum: 5}
end
