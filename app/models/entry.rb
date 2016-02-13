class Entry < ActiveRecord::Base

  validates :title,
            presence: true
  validates :body,
            presence: true
  validates :blog_id,
            numericality: {only_integer: true, greater_than:0}

  belongs_to :blog
  has_many :comments
end
