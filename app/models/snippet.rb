class Snippet < ActiveRecord::Base
  attr_accessible :content, :slug, :title

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :content, presence: true
end
