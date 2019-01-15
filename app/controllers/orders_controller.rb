class OrdersController < ApplicationController
  def show
    @order = Order.find_by id: params[:id]

    respond_to do |format|
      format.html
      format.pdf do
        disposition = (params[:download] == "true") ? "attachment" : "inline"

        render pdf: "order #{@order.token}",
          disposition: disposition,
          template: "orders/show",
          layout: "layouts/application"
      end
    end
  end
end
