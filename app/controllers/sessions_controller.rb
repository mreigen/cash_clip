class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      
      # if there is a uncompleted bill session var, meaning there was an uncompleted claimed bill
      # (user entered a bill and then logged in)
      # then update user_id on that bill with current_user.id
      unless session[:uncompleted_bill].blank?
        @bill = session[:uncompleted_bill]
        @bill.user_id = current_user.id
        session[:uncompleted_bill] = nil
        
        if @bill.save
          redirect_to_target_or_default root_url, :notice => "Logged in successfully."
        else
          redirect_to new_bill_path, :notice => "You already claimed this bill. Do you want to try another one?"
        end
      end
      
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :controller => 'posts', :action => 'index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
