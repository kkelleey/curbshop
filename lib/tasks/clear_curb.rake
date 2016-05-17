namespace :clear_curb do
  desc "Set all items with bids to SOLD"
  task sell_items: :environment do
    Item.joins(:bids).where(sold: false).update_all(sold: true)
  end
end
