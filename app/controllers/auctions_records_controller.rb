class AuctionsRecordsController < InheritedResources::Base

  load_and_authorize_resource
  before_action :set_auctions_records, only: [:edit,:show,:destroy]

  def index
    @auctions_records = AuctionsRecord.order("id").page(params[:page]).per_page(10)
  end

  def searchFilterData 
    @param = "%"+params[:q]+"%"
    
    @persons = Persona.where("concat(name , name2 , last_name1, last_name2) like ?",@param)
    @personsList = []

    @persons.each do |person|
      Rails.logger.info person.id
      @personsList.push(person.id)
    end
    Rails.logger.info @personsList
    @auctions_records=AuctionsRecord.includes(award_person_id: @personsList)
    render json: @auctions_records
  end

  def new
    @auction_id=params['format']
    @status = 3
    @auctions_records = AuctionsRecord.new
  end

  def create
    @auctions_records = AuctionsRecord.new(auctions_record_params)
    @auctions_records.save
    @auctions_records.reload
    @id = @auctions_records.id
    @auctionsRecordsPersonaValidate = AuctionsRecordsPersona.where(auctions_record_id:@id)
    @auctionsRecordsPersonaValidate.destroy_all
    params[:auctions_record][:bidders].each do |p|
      if(p.to_s !="")
        @num = p.to_i
        @idPersona = (p.to_i < 0) ? @num * -1 : @num;
        @tipo = (p.to_i < 0) ? "Legal" : "Natural"
        @auctionsRecordsPersona = AuctionsRecordsPersona.new(auctions_record_id:@id,persona_id:@idPersona,persona_type:@tipo,persona_type_description:"Postor")
        @auctionsRecordsPersona.save
      end
    end
    params[:auctions_record_award_person_list].each do |p|
      params[:price].each do |n|
        if(p.to_s !="")
          @num = p.to_i
          @idPersona = (p.to_i < 0) ? @num * -1 : @num;
          @tipo = (p.to_i < 0) ? "Legal" : "Natural"
          @price = n.to_i
          @auctionsRecordsPersona = AuctionsRecordsPersona.new(auctions_record_id:@id,persona_id:@idPersona,persona_type:@tipo,persona_type_description:"Adjudicatario",award_amount:@price)
          @auctionsRecordsPersona.save
        end
      end
    end
    redirect_to @auctions_records
  end

  def show
  end

  def edit
    @awardPersonList = AuctionsRecordsPersona.where(auctions_record_id:params[:id],persona_type_description:"Adjudicatario")
    @bidders = AuctionsRecordsPersona.where(auctions_record_id:params[:id],persona_type_description:"Postor")
  end

  def update
    @auctions_records.update(auctions_record_params)
    @id = params[:id]
    @auctionsRecordsPersonaValidate = AuctionsRecordsPersona.where(auctions_record_id:@id)
    @auctionsRecordsPersonaValidate.destroy_all
    params[:auctions_record][:bidders].each do |p|
      if(p.to_s !="")
        @num = p.to_i
        @idPersona = (p.to_i < 0) ? @num * -1 : @num;
        @tipo = (p.to_i < 0) ? "Legal" : "Natural"
        @auctionsRecordsPersona = AuctionsRecordsPersona.new(auctions_record_id:@id,persona_id:@idPersona,persona_type:@tipo,persona_type_description:"Postor")
        @auctionsRecordsPersona.save
      end
    end
    params[:auctions_record_award_person_list].each do |p|
      params[:price].each do |n|
        if(p.to_s !="")
          @num = p.to_i
          @idPersona = (p.to_i < 0) ? @num * -1 : @num;
          @tipo = (p.to_i < 0) ? "Legal" : "Natural"
          @price = n.to_i
          @auctionsRecordsPersona = AuctionsRecordsPersona.new(auctions_record_id:@id,persona_id:@idPersona,persona_type:@tipo,persona_type_description:"Adjudicatario",award_amount:@price)
          @auctionsRecordsPersona.save
        end
      end
    end
    redirect_to auctions_records_path
  end

  def destroy
    @id = params[:id]
    @auctionsRecordsPersonaValidate = AuctionsRecordsPersona.where(auctions_record_id:@id)
    @auctionsRecordsPersonaValidate.destroy_all
    @auctions_records=AuctionsRecord.find(@id)
    @auctions_records.destroy
    redirect_to auctions_records_path
  end

  private
  def set_auctions_records
    @auctions_records = AuctionsRecord.find(params[:id])
  end
  
  def auctions_record_params
    params.require(:auctions_record).permit(:auction_id, :date, :award_person_id, :award_amount, :file_name, :status )
  end

end
  

