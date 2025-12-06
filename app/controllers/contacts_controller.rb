class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: "お問い合わせを送信しました。ありがとうございます。"
    else
      flash.now[:alert] = "入力内容に不備があります。ご確認ください。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end

end
