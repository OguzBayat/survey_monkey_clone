class SurveysController < ApplicationController

	def index
		@surveys = Survey.all
	end

	def show
		@survey = Survey.find params[:id]
		poll_ids = @survey.polls.pluck(:id)
	end

	def new
		@survey = Survey.new
	end

	def create
		survey = Survey.create(survey_params)
		if survey
			puts survey.errors.full_messages
			render json: { status: "success" }
		else
			render json: { status: "failed" }
		end
	end

	def edit
		@survey = Survey.find params[:id]
	end

	def update
		@survey = Survey.find params[:id]
		@survey.assign_attributes(survey_params)
		if @survey.save
			render json: { status: "success" }
		else
			render json: { status: "failed" }
		end
	end

	def submit
		survey = Survey.find(params[:id])

		if survey.is_closed?
			render json: { status: "failed" }
			return false
		end
		ActiveRecord::Base.transaction do
			begin
				params[:answers].each do |poll, answer, textanswer|
					if answer == "-1"
						ans = "-1"
						tans = params[:textanswers]["#{poll}"]
					else
						ans = answer
						tans = answer
					end

					PollAnswer.create(poll_id: poll, answer: ans, textanswer: tans)
				end
				render json: { status: "success" }
			rescue Exception => e
				render json: { status: "failed" }
			end
		end
	end

	def results
		@survey = params[:s] ? Survey.find(params[:s]) : Survey.first
		@pollanswers = PollAnswer.where(poll_id: @survey.polls.ids)
		arr = []
		@survey.polls.each do |poll|
			if !poll.options.nil?
				arr << poll.results
			end
		end

		@map = @survey.polls.where.not(options: nil).each_with_index.map { |i,index| {
			question: i['question'],
			options: i['options'],
			count: arr[index]
		}}
		
	end

	private

		def survey_params
			params.require(:survey).permit(:title, :closed, :end_date, polls_attributes: [:id, :_destroy, :question, options: []])
		end

end
