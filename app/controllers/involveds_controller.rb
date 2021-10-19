class InvolvedsController < ApplicationController
	def create
		@inquery = Inquery.find(params[:inquery_id])
		@involved = @inquery.involveds.create(involved_params)
		redirect_to inquery_path(@inquery)
	end

	def destroy
		@inquery = Inquery.find(params[:inquery_id])
		@involved = @inquery.involveds.find(params[:id])
		@involved.destroy
		redirect_to inquery_path(@inquery)
	end

	private
	def involved_params
		params.require(:involved).permit(:person_id, :typeinvolved, :inquery_id)

	end
end
 