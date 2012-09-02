class BillsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  
  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.json
  def new
    @bill = Bill.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(params[:bill])
    
    @bill.bank_id = params[:bill][:serial][0,1].to_s
    #FedBank.by_bank_id(fed_bank).first.id.to_s.inspect
    current_user.fedbank_users.create(:fedbank_id => @bill.bank_id) unless current_user.blank?
    
    respond_to do |format|
      # if user hasn't logged in yet
      # save the bill they have entered
      # and prompt them to the log in / register page
      if params[:bill][:user_id].blank?
        #@bill.save
        session[:uncompleted_bill] = @bill
        
        format.html { redirect_to login_path }
      elsif current_user.has_bill?(params[:bill][:serial]) 
        format.html { redirect_to @bill, :notice => 'You already entered a bill with the serial: ' + params[:bill][:serial] }
      elsif @bill.save
        
        # if group doesn't exist
        unless @bill.has_a_group?
          @group = Group.create({ :bill_id => @bill.id })
          # generate random group's name
          @group.name = @group.generate_random_name
          @group.save
          @bill.group = @group
          @bill.save
        else
          # if group exists, 
          @group = Group.find_by_bill_serial(@bill.serial)
          
          # if the group already has 5 followers, remove the first follower
          if @group.followers.count > 5
            first_follower = @group.followers.first
            first_follower.stop_following(@group)
          end
        end
        # make user to follow group
        current_user.follow(@group)
        
        format.html { redirect_to @bill, :notice => 'Bill was successfully created.' }
        #format.json { render json: @bill, status: :created, location: @bill }
      else
        format.html { render :action => "new" }
        #format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /bills/1
  # PUT /bills/1.json
  def update
    @bill = Bill.find(params[:id])
   
    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to @bill, :notice => 'Bill was successfully updated.' }
        #format.json { head :ok }
      else
        format.html { render :action => "edit" }
        #format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url }
      #format.json { head :ok }
    end
  end
  
  def user
    @bills = Bill.where(:user_id => User.find(params[:id]).id)
    
    respond_to do |format|
      format.html
      #format.json { render json: @bills }
    end
  end
  
  def self.find_by_user_id (userid)
    Bill.where(:user_id => userid)
  end
  
end
