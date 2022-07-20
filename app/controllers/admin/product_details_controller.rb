class Admin::ProductDetailsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_item_params)
      @order = Order.find_by(id: @order_item.order_id )
      all_complete?(@order)
      any_producting?(@order)
      redirect_to admin_path(@order_item.order), notice: "製作ステータスを更新しました"
    else
      render 'orders/show', alert: "製作ステータスを更新できませんでした"
    end
  end

  # 製作ステータスをすべて「製作完了」にしたとき、注文ステータスを「発送準備中」にする
  def all_complete?(order)

    if order.order_items.all? do |order_item|
      order_item.status == "complete"
      end
      order.update(status: "ready_to_ship")
      flash[:success] = "注文ステータスが「発送準備中」に更新されました"
    end
  end

  # 製作ステータスが1つでも「製作中」になったとき、注文ステータスを「製作中」にする
  def any_producting?(order)
    if order.order_items.any? do |order_item|
      order_item.status == "producting"
      end
      order.update(status: "producting")
      flash[:success] = "注文ステータスが「製作中」に更新されました"
    end
  end


  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end
end
