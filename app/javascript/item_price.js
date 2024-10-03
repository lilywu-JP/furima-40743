const price = () => {
  const itemPriceElement = document.getElementById('item-price');
  const feeElement = document.getElementById('fee');
  const profitElement = document.getElementById('profit');

  feeElement.textContent = 0;
  profitElement.textContent = 0;

  itemPriceElement.addEventListener("input", () => {
    const price = itemPriceElement.value;
      const fee = Math.floor(price * 0.1);
      const profit = price - fee;
      feeElement.textContent = fee;
      profitElement.textContent = profit;

    })
  }

     window.addEventListener("turbo:load", price);
     window.addEventListener("turbo:render", price);
  