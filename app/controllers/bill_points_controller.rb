class BillPointsController < ApplicationController
  # GET /bill_points
  # GET /bill_points.json
  def index
    @bill_points = BillPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bill_points }
    end
  end

  # GET /bill_points/1
  # GET /bill_points/1.json
  def show
    @bill_point = BillPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill_point }
    end
  end

  # GET /bill_points/new
  # GET /bill_points/new.json
  def new
    @bill_point = BillPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill_point }
    end
  end

  # GET /bill_points/1/edit
  def edit
    @bill_point = BillPoint.find(params[:id])
  end

  # POST /bill_points
  # POST /bill_points.json
  def create
    @bill_point = BillPoint.new(params[:bill_point])

    respond_to do |format|
      if @bill_point.save
        format.html { redirect_to @bill_point, notice: 'Bill point was successfully created.' }
        format.json { render json: @bill_point, status: :created, location: @bill_point }
      else
        format.html { render action: "new" }
        format.json { render json: @bill_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bill_points/1
  # PUT /bill_points/1.json
  def update
    @bill_point = BillPoint.find(params[:id])

    respond_to do |format|
      if @bill_point.update_attributes(params[:bill_point])
        format.html { redirect_to @bill_point, notice: 'Bill point was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_points/1
  # DELETE /bill_points/1.json
  def destroy
    @bill_point = BillPoint.find(params[:id])
    @bill_point.destroy

    respond_to do |format|
      format.html { redirect_to bill_points_url }
      format.json { head :ok }
    end
  end
end
