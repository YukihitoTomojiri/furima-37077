window.addEventListener('load', function(){
  const price = document.getElementById("item-price");
  const sales_fee = document.getElementById("add-tax-price");
  const sales_profit = document.getElementById("profit");

  price.addEventListener("input",function(){
    sales_fee.innerHTML = Math.round(price.value * 0.1);
    sales_profit.innerHTML = Math.round(price.value - Math.round(price.value * 0.1));
  })
  
});