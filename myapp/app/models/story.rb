class Story < ActiveRecord::Base
  validates_presence_of :name, :link, :description
  validates_uniqueness_of :link
  has_many :votes

end
