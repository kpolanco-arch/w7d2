class Band < ApplicationRecord
    validates :name, presence :true

def index
    @band = Band.all
    render :index
end

def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "Object successfully created"
      redirect_to @band
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
end

def new
    @band = Band.new
    render :new
end

def edit
    @band = Band.find(params[:id])
    render :edit
end

def show
    @band = Band.find(params[:id])
    render :show
end

def destroy
    @band = Band.find(params[:id])
    if @band.destroy
        redirect_to bands_url
    end
end

end