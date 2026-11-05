const products = [
  { id: 1, title: 'Ноутбук 15"', category: "Компьютеры", price: 85000 },
  { id: 2, title: 'Монитор 27"', category: "Компьютеры", price: 28000 },
  { id: 3, title: "Клавиатура", category: "Аксессуары", price: 6500 },
  { id: 4, title: "Мышь Беспроводная", category: "Аксессуары", price: 2500 },
  { id: 5, title: "Наушники игровые", category: "Аксессуары", price: 4500 },
  { id: 6, title: "Коврик для мыши", category: "Аксессуары", price: 1200 },
];

let cart = [];

const catalog = document.getElementById("catalog");
const cartCount = document.getElementById("cart-count");
const cartSum = document.getElementById("cart-sum");
const clearCartBtn = document.getElementById("clear-cart");

function renderProducts() {
  catalog.innerHTML = products
    .map(
      (p) => `
    <div class="card">
      <div class="category">${p.category}</div>
      <h3>${p.title}</h3>
      <div class="price">${Number(p.price).toLocaleString("ru-RU")} ₽</div>
      <button data-id="${p.id}">В корзину</button>
    </div>
  `,
    )
    .join("");
}

function renderCart() {
  cartCount.textContent = cart.length;
  cartSum.textContent = cart
    .reduce((sum, p) => sum + Number(p.price), 0)
    .toLocaleString("ru-RU");
}

catalog.addEventListener("click", (e) => {
  if (e.target.tagName !== "BUTTON") return;

  const product = products.find((p) => p.id === Number(e.target.dataset.id));
  if (product) {
    cart.push(product);
    renderCart();
  }
});

clearCartBtn.addEventListener("click", () => {
  cart = [];
  renderCart();
});

renderProducts();
renderCart();
