let productsUrl = 'http://localhost:5000/product/';
let link = 'https://jsonplaceholder.org/posts';

let product = document.querySelector('.all-products__wrapper')

async function getResponce() {
    let responce = await fetch(productsUrl);
    let content = await responce.json();
    console.log(content);
    let key;
    for (key in content) {
        product.innerHTML += `<a href="./product-page.html" class="cards">
        <p class="sale">SALE</p>
        <img class="liked-product" src="./img/icons/likedproduct.svg" alt="">
        <img class="popular-products-cards-img"  src="${content[key].image}" alt="Рюкзак">
        <h4 class="title-4">${content[key].model}</h4>
        <span class="cost">${content[key].price}</span>
        <button class="cart"> 
            <img src="./img/cards/Vector.svg" class="cart-image" alt="">
        </button>
        </a>`
        console.log(content[key])
    }
} 

getResponce()