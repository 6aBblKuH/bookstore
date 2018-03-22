class OrderMailer < ApplicationMailer
    def confirm_order(user, order)
      @user = user
      @url  = order_confirm_url(order, order.confirmation_token)
      mail(to: @user.email, subject: 'Confirm your order')
    end
end