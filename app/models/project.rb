class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :pledges
  has_many :rewards
  has_many :comments
end
