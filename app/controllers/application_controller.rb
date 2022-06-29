class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  def self.login(attr)
    user = User.find_by(attr[:phone])
    if user.password == attr[:password]
      user
    else
      {data: "Error login"}
    end
  end

  def check_if_user_exist?(attr)
    user = User.find_by(attr[:phone])
    if user.phone == attr[:phone]
      true
    else
      false
    end
  end

  def self.add_contact(attr)

    new_contact = User.create(attr)

  end


  #login
  get "/login/?:phone/?:password" do
    # { message: "Good luck with your project!" }.to_json
    phones = self.login(phone: params[:phone], password: params[:password])
    phones.to_json
  end

  post "/users" do 
    if self.check_if_user_exist? 
      res = {respone: "User Exist"}
    else
      new_user = User.create(
        # name: params[:name],
        email: params[:email],
        image: params[:image],
        phone: params[:phone],
        password: params[:password],
        username: params[:username]
      )
      new_user.save
      new_user.to_json
    end
  end

  post "/messages" do 
    new_message = Message.create(
      text_massage: params[:text_massage],
      sender: params[:sender],
      receiver: params[:receiver],
      type: params[:type]
    )
    new_message.save
  end

  post "/businesses" do 
    new_business = Business.create(
      item_name: params[:item_name],
      phone: params[:phone],
      price: params[:price],
      item_id: params[:item_id],
      business_name: params[:business_name],
      image: params[:image],
      description: params[:description]
    )
    new_business.save

  end

  get "/messages/msg/?:currentuser/?:activechat" do
    msgs = Message.where(["sender= '%s' and receiver = '%s'", params[:currentuser], params[:activechat]]).or(
      Message.where(["sender = '%s' and receiver = '%s'", params[:activechat], params[:currentuser]])
    )

    msgs.to_json
  end

  get "/contacts/?" do

  end

end
