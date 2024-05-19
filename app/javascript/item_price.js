//販売手数料の計算を関数（displayFee)として定義
function displayFee() {
  const itemPrice = document.getElementById("item-price").value;//販売価格の入力値を取得、itemPriceに代入
  const fee = Math.floor(itemPrice / 10);//itemPriceに入力された数値の10％を小数点以下を切り捨(Math.floor)、feeに代入
  const addTaxDom = document.getElementById("add-tax-price");//販売手数料を表示する場所を取得
  addTaxDom.innerHTML = fee;//販売手数料を表示する場所のHTMLをfeeで更新する
}
//id:item-priceの値が変更された時(input)、関数displayFeeが実行される
document.getElementById("item-price").addEventListener("input", displayFee);


//販売利益の計算を関数(profit)とする
function profit() {
  const itemPrice = document.getElementById("item-price").value;//販売価格の入力値を取得、itemPriceに代入
  const fee = Math.floor(itemPrice / 10);//itemPriceに入力された数値の10％を小数点以下を切り捨(Math.floor)、feeに代入
  const profit = itemPrice - fee;//販売利益の計算
  const profitDom = document.getElementById("profit");//販売利益を表示する場所を取得
  profitDom.innerHTML = profit;//販売利益のHTMLをprofitで更新
}
//id:item-priceの値が更新されたとき(input)、関数profitが実行される
document.getElementById("item-price").addEventListener("input", profit);