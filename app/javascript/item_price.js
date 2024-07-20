function item_price (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const tenPercentValue = Math.floor(itemPrice.value * 0.1);
    const charNum = document.getElementById("add-tax-price");
    charNum.innerHTML = `${ tenPercentValue }`;
    const profitValue = Math.floor(itemPrice.value - tenPercentValue);
    const profit = document.getElementById("profit")
    profit.innerHTML = `${ profitValue }`;
  });
};


window.addEventListener('turbo:load', item_price);