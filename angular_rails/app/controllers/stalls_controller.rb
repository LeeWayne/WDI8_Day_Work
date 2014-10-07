class StallsController < ApplicationController
  # GET /stalls
  # GET /stalls.json
  def index
    @stalls = Stall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stalls }
    end
  end

  # GET /stalls/1
  # GET /stalls/1.json
  def show
    @stall = Stall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stall }
    end
  end

  # GET /stalls/new
  # GET /stalls/new.json
  def new
    @stall = Stall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stall }
    end
  end

  # GET /stalls/1/edit
  def edit
    @stall = Stall.find(params[:id])
  end

  # POST /stalls
  # POST /stalls.json
  def create
    @stall = Stall.new(params[:stall])

    respond_to do |format|
      if @stall.save
        format.html { redirect_to @stall, notice: 'Stall was successfully created.' }
        format.json { render json: @stall, status: :created, location: @stall }
      else
        format.html { render action: "new" }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stalls/1
  # PUT /stalls/1.json
  def update
    @stall = Stall.find(params[:id])

    respond_to do |format|
      if @stall.update_attributes(params[:stall])
        format.html { redirect_to @stall, notice: 'Stall was successfully updated.' }
        format.json { render json: @stall }
      else
        format.html { render action: "edit" }
        format.json { render json: @stall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stalls/1
  # DELETE /stalls/1.json
  def destroy
    @stall = Stall.find(params[:id])
    @stall.destroy

    respond_to do |format|
      format.html { redirect_to stalls_url }
      format.json { head :no_content }
    end
  end
end
