class Relatorios::LivrosController < ApplicationController
	before_action :tables

	def inqueries
		respond_to do |format|
			format.js
			format.pdf do
				render template: 'relatorios/livros/related/inqueries', 
				pdf: 'Inqueritos', 
				header:  { html: {template: @header }},
				footer:  { html: {template: @footer }}
			end
		end
	end
	
	def precatories
		respond_to do |format|
			format.js
			format.pdf do
				render template: 'relatorios/livros/related/precatories', 
				pdf: 'Precatorias', 
				header:  { html: {template: @header }},
				footer:  { html: {template: @footer }}
			end
		end
	end

def seizures
		respond_to do |format|
			format.js
			format.pdf do
				render template: 'relatorios/livros/related/seizures', 
				pdf: 'Apreensoes', 
				header:  { html: {template: @header }},
				footer:  { html: {template: @footer }}
			end
		end
	end



	private



	def tables
		
		if params[:year].blank?
			params[:year] = Time.new.year
		end
		
		@inqueries = Inquery.all_user(current_user.registry_id).where(dp: current_user.registry.dp).search_year(params[:year]).order(:establishment)
		@precatories = Precatory.joins(:inquery).where("inqueries.registry_id = #{current_user.registry_id}").search_precatory_year(params[:year])
		@seizures = Seizure.all
		
	end

end
