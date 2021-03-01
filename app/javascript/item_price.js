const set =() =>{
  const priceInput=document.getElementById("item-price");
  priceInput.addEventListener("input",()=>{
    const inputValue=priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(parseInt(inputValue)*0.1) ;
    const salesProfit=document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(parseInt(inputValue) - Math.floor(parseInt(inputValue)*0.1)) ;
  });
};

window.addEventListener("load",set);