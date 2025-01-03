# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
#販売手数料・利益を計算するjsファイル読み込み
pin "item_price", to: "item_price.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# トークン化を行うファイルを作成
pin "card", to: "card.js"
