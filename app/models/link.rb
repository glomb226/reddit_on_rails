class Link < ActiveRecord::Base
  attr_accessible :url, :title

  belongs_to :user
end
