class Choir <ApplicationRecord
  has_many :choir_members

  validates_presence_of :name
  validates_presence_of :openings
  validates_presence_of :active 

  def self.order_by_creation
    self.all.order(created_at: :desc)
  end

  def member_count
    choir_members.count
  end
end
