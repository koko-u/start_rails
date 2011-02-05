class Task < ActiveRecord::Base
  scope :finished, where(:done => true).order('due_date DESC')
  scope :unfinished, where(:done => false).order('due_date')
  scope :search, lambda { |query| where([ 'name LIKE ?', "%#{query}%"]) }
end
