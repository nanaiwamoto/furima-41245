const price = () => {

// 要素の取得
const itemPriceInput = document.getElementById("item-price");
const feeDisplay = document.getElementById("add-tax-price");
const profitDisplay = document.getElementById("profit");

// 入力イベントリスナーの設定
itemPriceInput.addEventListener("input", () => {
  const itemPrice = parseInt(itemPriceInput.value); // 入力値を数値に変換

  if (isNaN(itemPrice)) {
    // 無効な値の場合、表示をリセット
    feeDisplay.textContent = "";
    profitDisplay.textContent = "";
  } else {
    const fee = Math.floor(itemPrice * 0.1); // 10%の手数料を計算
    const profit = itemPrice - fee;         // 利益を計算
    feeDisplay.textContent = fee;          // 手数料を表示
    profitDisplay.textContent = profit;    // 利益を表示
  }
});

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
