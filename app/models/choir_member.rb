class ChoirMember <ApplicationRecord
  belongs_to :choir

  validates_presence_of :name
  # validates :name, presence: true
  validates_presence_of :age
  validates_presence_of :active
  validates_presence_of :voice_type
end
