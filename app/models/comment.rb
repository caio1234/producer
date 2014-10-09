class Comment < ActiveRecord::Base
  belongs_to :post
  #validate :post, :associated => true, :presence => true
  
  validates_presence_of :body, :post
  validates_associated :post
  
  with_options :allow_blank => true do |c|
	  c.validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	  #Validação de url deu erro necessário pegar uma espressaõ regular correta
	  #c.validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  end
end
