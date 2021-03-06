class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :pledges
  has_many :rewards
  has_many :comments
  has_many :backers, through: :pledges, class_name: 'User'

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def funding_total
    pledges.map { |p| p.reward.amount }.reduce(:+)
  end
end
