ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Последние заказы" do
          table_for Order.order('id desc').limit(10) do
            column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
            column("Date", :created_at)
            column("Customer")                {|order|  order.name }
            column("Customer email")          {|order|  order.email }
            column("Customer phone")          {|order|  order.phone }
            column("Delivery address")        {|order|  order.adress }
            column("Total")                   {|order| number_to_currency order.total_price }
          end
        end
      end

    end # columns
  end # content
end
