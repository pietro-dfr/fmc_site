const cartIcon = document.getElementById('cart-icon');
const cartSidebar = document.getElementById('cart-sidebar');
const closeCartBtn = document.querySelector('.close-cart');

cartIcon.addEventListener('click', () => {
    cartSidebar.classList.add('open');
});

closeCartBtn.addEventListener('click', () => {
    cartSidebar.classList.remove('open');
});

const addToCartButtons = document.querySelectorAll('.add-to-cart');
const cartItemsContainer = document.querySelector('.cart-items');

addToCartButtons.forEach(button => {
    button.addEventListener('click', () => {
        const productCard = button.closest('.product-card');
        const name = productCard.querySelector('.product-name').textContent;
        const price = productCard.querySelector('.product-price').textContent;

        addItemToCart(name, price);
    });
});

function addItemToCart(name, price) {
    const item = document.createElement('div');
    item.classList.add('cart-item');
    item.innerHTML = `
        <p><strong>${name}</strong><br>${price}</p>
        <button class="remove-item">Remover</button>
    `;

    const emptyMsg = cartItemsContainer.querySelector('p');
    if (emptyMsg && emptyMsg.textContent.includes('Vazio')) {
        emptyMsg.remove();
    }

    cartItemsContainer.appendChild(item);

    item.querySelector('.remove-item').addEventListener('click', () => {
        item.remove();

        if (cartItemsContainer.children.length === 0) {
            const empty = document.createElement('p');
            empty.textContent = 'Vazio.';
            cartItemsContainer.appendChild(empty);
        }
    });
}
