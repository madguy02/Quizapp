class QuestionsController < ApplicationController
	def index
		@questions = Question.all
		@questions.sort! {|a,b| a.text <=> b.text}

		respond_to do |format|
			format.html
			format.xml {render :xml => @questions}
		end
	end

	def show
		@question = Question.find(params[:id])

		respond_to do |format|
			format.html
			format.xml {render :xml => @question}
		end
	end

	def new
		@question = Question.new
		respond_to do |format|
			format.html
			format.xml {render :xml => @question}
		end
	end

	def edit
		@question = Question.new (params[:question])
	end

	def create
		@question = Question.new(params[:question])

		respond_to do |format|
			if @question.save
				format.html {redirect_to(@question, :notice =>'Question was successfully created')}
				format.xml	{render :xml => @question.errors, :status => :unprocessable_entity}
end
end
end

def update
	@question = Question.find(params[:id])
	respond_to do |format|
		if @question.update_attributes(params[:question])
			format.html {redirect_to(@question, :notice =>'Question was successfully updated')}
			format.xml {head :ok}
		else
			format.html {render :action =>"edit"}
			format.xml {render :xml => @question.errors, :status=> :unprocessable_entity}
		end
	end
end

def destroy
	@question = Question.find(params[:id])
	@question.destroy
	respond_to do |format|
		format.html {redirect_to(questions_url)}
		format.xml {head :ok}
	end
end
end