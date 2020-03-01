class Poll < ApplicationRecord
  belongs_to :survey
  has_many :poll_answers
  serialize :options

  def results
  	answ = self.poll_answers.pluck(:answer)
  	self.options.each_with_index.map do |opt, idx|
  		answ.count(idx)
  	end
  end
end
