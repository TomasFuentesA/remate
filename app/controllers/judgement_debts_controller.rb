class JudgementDebtsController < ApplicationController

    
    load_and_authorize_resource
    before_action :set_judgement_debt, only: [:edit,:show,:destroy]

    def index
        @judgementsDebts = JudgementDebt.order("id").page(params[:page]).per_page(10)
    end

    def new
        @judgement_id= params['format']? params['format']:''
        @judgementdebt = JudgementDebt.new
        @judgementdebt.judgement_id = @judgement_id
    end

    def create
        @judgement_id=params['format']
        @judgementdebt = JudgementDebt.new(judgement_debt_params)
        @judgementdebt.save
        if @judgement_id
            @judgement_id=params['judgement_debt']['judgement_id'].to_i
            redirect_to judgement_path(@judgement_id)
        else
            redirect_to judgement_debts_path
        end
    end

    def show
    end
  
    def edit
    end

    def update
        Rails.logger.info params
        @judgementdebt.update(judgement_debt_params)
        redirect_to judgement_debts_path
    end

    def destroy
        @judgementdebt=JudgementDebt.find(params[:id])
        @judgementdebt.destroy
        redirect_to judgement_debts_path
    end
     
    private
  
    def set_judgement_debt
      @judgementdebt = JudgementDebt.find(params[:id])
    end
  
    def judgement_debt_params
      params.require(:judgement_debt).permit(
        :person_id,
        :person_type,
        :money_total,
        :money_type,
        :debt_date,
        :debt_type,
        :judgement_id)
    end
end
