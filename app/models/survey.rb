class Survey < ApplicationRecord
	has_many :polls, dependent: :destroy
	accepts_nested_attributes_for :polls, allow_destroy: true

	def is_closed?
		self.closed or (self.end_date and self.end_date <= Date.today)
	end
end
