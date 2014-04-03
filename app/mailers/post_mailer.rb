class PostMailer < ActionMailer::Base
  default from: "LocoTrades"

  def offer_posted(user)
    @user = user

    mail to: user.email, subject: "You have a new Offer!"
  end
end
