class List < ActiveRecord::Base
  has_many :tasks
  has_and_belongs_to_many :users

  def invite(user)
    unless user.lists.include?(self)
      user.lists << self
    end
  end

end
