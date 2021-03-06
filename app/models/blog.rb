class Blog < ActiveRecord::Base
  validates :title,
            presence: true,
            uniqueness: true

  has_many :entries
end
