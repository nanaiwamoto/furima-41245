const price = () => {

// 要素の取得
const itemPriceInput = document.getElementById("item-price");
const feeDisplay = document.getElementById("add-tax-price");
const profitDisplay = document.getElementById("profit");

// 入力イベントリスナーの設定
itemPriceInput.addEventListener("input", () => {
  const itemPrice = parseFloat(itemPriceInput.value);

  if (isNaN(itemPrice)) {
    // 無効な値の場合、表示をリセット
    feeDisplay.textContent = "";
    profitDisplay.textContent = "";
  } else {
 // 手数料計算（小数点以下切り捨て）
 const fee = Math.floor(itemPrice * 0.1);
      
 // 利益計算（小数点以下切り捨て）
 const profit = Math.floor(itemPrice - fee);
 
 // 結果を表示
 feeDisplay.textContent = fee;
 profitDisplay.textContent = profit;
}
});
};

// イベントリスナーの設定
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
