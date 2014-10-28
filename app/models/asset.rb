class Asset < ActiveRecord::Base
  
  validates_presence_of :title
  
  has_attached_file :document, :styles => { :medium => "300x300#", :thumb => "50x50"}#redimensiona centralizando
  #has_attached_file :document, :style => { :medium => "300x300<"}redimensiona somente se for maior
  #has_attached_file :document, :style => { :medium => "300x300!"}redimensiona
  # 
  validates_attachment_size :document, :less_than => 5.megabyte
  validates_attachment_content_type :document, :content_type => %w(image/png image/jpeg image/pjpeg image/gif image/tiff)
  validates_attachment_presence :document
end
