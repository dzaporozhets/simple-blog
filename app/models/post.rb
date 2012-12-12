class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :preview, :published, :slug, :title

  scope :published, where(published: true)
  scope :recent, order('updated_at DESC')

  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :slug, presence: true
  validates :body, presence: true
  validates :preview, presence: true
  validates :author, presence: true

  delegate :name, :email, to: :author, prefix: true
end
