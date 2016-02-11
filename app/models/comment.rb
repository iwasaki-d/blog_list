class Comment < ActiveRecord::Base
  validates :id, uniqueness:  true
  belongs_to :entry

  def approved?
    return self.status == 'approved'
  end
end
