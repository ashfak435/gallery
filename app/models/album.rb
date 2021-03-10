class Album < ApplicationRecord
    validates :title , presence: true
    validates :discription, presence: true , length: {minimum: 10}
    has_many_attached :images
    belongs_to :admin
    has_many :taggings
has_many :tags, through: :taggings
def all_tags=(names)
  self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
  end
end

def all_tags
  self.tags.map(&:name).join(", ")
end

end
