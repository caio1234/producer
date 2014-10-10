class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :categories
  
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  
  validates_presence_of :title, :body, :slug#, :author
  #validates_associated :author
  validates_uniqueness_of :slug
  validates_inclusion_of :draft, :in => [true, false]
  
  scope :published, lambda {
    where("draft = ? AND published_at ?", false, Time.current)    
  }
  
  scope :search, lambda { |terms|
    where("title LIKE :t OR body LIKE :t", :t => "%#{terms}%")
  }

end
