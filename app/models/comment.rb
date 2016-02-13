class Comment < ActiveRecord::Base

  validates :id, uniqueness:  true

  validates :body,
            presence: true

  validates :entry_id,
            numericality: {only_integer: true, greater_than:0}

  belongs_to :entry

  def approved?
    return self.status == 'approved'
  end
end
