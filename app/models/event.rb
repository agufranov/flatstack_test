class Event < ActiveRecord::Base
  enum :interval => [:once, :day, :week, :month, :year]
  belongs_to :user

  validates_presence_of :name, :start_at, :interval

  def self.at_date(date)
    # TODO
  end
end
