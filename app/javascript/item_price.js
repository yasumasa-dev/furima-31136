window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
// console.log(inputValue);

var tax = 0.1;
var price = inputValue
var result = Math.floor(price * tax);
const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = result;

var gain = (inputValue - result)
const profitDom = document.getElementById("profit");
profitDom.innerHTML = gain;
})
});