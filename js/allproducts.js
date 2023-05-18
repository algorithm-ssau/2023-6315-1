let productsUrl = 'http://25.19.103.131:5000/product/';

let product = document.querySelector('.popular-products-cards')

let idProd = 0;

async function getResponce() {
    let responce = await fetch(productsUrl);
    let content = await responce.json();
    console.log(content);
    let key;
    for (key in content) {
        
        idProd++;
        if (content[key].action == 'Sale') {
            product.innerHTML += `
            <div class="cards" data-id="${idProd}">
            <p class="sale">SALE</p>
            <img class="popular-products-cards-img"  src="${content[key].image}" alt="Рюкзак">
            <h4 class="title-4">${content[key].model}</h4>
            <div class="product__price"><span class="product__price-number">${content[key].price}</span> ₽</div>
            <div class="product__quantity"></div>
            <button data-cart type="button" class="cart" 
            data-sb-id-or-vendor-code="${idProd}"
            data-sb-product-name="${content[key].model}"
            data-sb-product-price="${content[key].price}"
            data-sb-product-quantity="1"
            data-sb-product-img="${content[key].image}"></button>
        </div>`
        } else {
            product.innerHTML += `
            <div class="cards" data-id="${idProd}">
                    <img class="popular-products-cards-img"  src="${content[key].image}" alt="Рюкзак">
                    <h4 class="title-4">${content[key].model}</h4>
                    <div class="product__price"><span class="product__price-number">${content[key].price}</span> ₽</div>
                    <div class="product__quantity"></div>
                    <button data-cart type="button" class="cart" 
                    data-sb-id-or-vendor-code="${idProd}"
                    data-sb-product-name="${content[key].model}"
                    data-sb-product-price="${content[key].price}"
                    data-sb-product-quantity="1"
                    data-sb-product-img="${content[key].image}"></button>
                </div>`

        }
        // if (content[key].type == "Квадроциклы") {
        //     product.innerHTML += `<a href="./product-page.html" class="cards">
        // <p class="sale">SALE</p>
        // <img class="liked-product" src="./img/icons/likedproduct.svg" alt="">
        // <img class="popular-products-cards-img"  src="${content[key].image}" alt="Рюкзак">
        // <h4 class="title-4">${content[key].model}</h4>
        // <span class="cost">${content[key].price}</span>
        // <button class="cart"> 
        //     <img src="./img/cards/Vector.svg" class="cart-image" alt="">
        // </button>
        // </a>`

        // <p class="sale">SALE</p>
        console.log(content[key])
    }
} 

getResponce()