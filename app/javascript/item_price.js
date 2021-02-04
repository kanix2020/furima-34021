window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxPrice = document.getElementById("add-tax-price");
    const Tax = (Math.floor(inputValue/10));
      addTaxPrice.innerHTML = Tax;
    
    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue - Tax));
  })
  
});