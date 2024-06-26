//販売手数料と利益の計算を関数(calculateFeeAndProfit)として定義
function calculateFeeAndProfit() {
  const itemPrice = document.getElementById("item-price").value;//販売価格の入力値を取得、itemPriceに代入
  const fee = Math.floor(itemPrice / 10);//手数料。itemPriceの数値の10％を小数点以下を切り捨(Math.floor)、feeに代入
  const profit = Math.floor(itemPrice - fee);//販売利益の計算

  const addTaxDom = document.getElementById("add-tax-price"); //販売手数料を表示する場所を取得
  addTaxDom.innerHTML = fee; //販売手数料を表示する場所のHTMLをfeeで更新する

  const profitDom = document.getElementById("profit");//販売利益を表示する場所を取得
  profitDom.innerHTML = profit;//販売利益のHTMLをprofitで更新
  console.log("calculateFeeAndProfit function has been called");
}

function addInputEventListener() {
  const itemPriceElement = document.getElementById("item-price");
   
  if (itemPriceElement != null) {
    itemPriceElement.addEventListener("input", calculateFeeAndProfit);
  }
}

window.addEventListener("turbo:load", addInputEventListener);
document.addEventListener('DOMContentLoaded', calculateFeeAndProfit);

document.addEventListener("turbo:load", calculateFeeAndProfit);
document.addEventListener("turbo:render", calculateFeeAndProfit);

