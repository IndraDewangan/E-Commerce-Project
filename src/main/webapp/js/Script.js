//alert("indra");
//function add_to_cart(pid,pname,price){
//    
//    let cart = localStorage.getItem("cart");
//    if(cart==null){
//        let products = [];
//        let product = {productId:pid, productName:pname,productQuantity:1,productPrice:price};
//        products.push(product);
//        localStorage.setItem("cart",JSON.stringify(products));
//        console.log("Product is added for the first time");
//    }else{
//        let pcart=JSON.parse(cart);
//        
//        let oldProduct = pcart.find((item)=>item.productId == pid);
//        if(oldProduct){
//            
//            oldProduct.productQuantity=oldProduct.productQuantity+1;
//            pcart.map((item)=>{
//                if(item.productId===oldProduct.productId){
//                    item.productQuantity = oldProduct.productQuantity;
//                }
//            });
//            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Product quantity is increased");
//            
//            
//        }else{
//            let product = {productId : pid, productName : pname, productQuantity:1, productPrice:price};
//            pcart.push(product);
//            localStorage.setItem("cart", JSON.stringify(pcart));
//            console.log("Product is added");
//        }
//        
//    }
//}
//
//updateCart();
//
//function updateCart(){
//    document.querySelector(".cart-body").innerHTML("<h3>Cart does not have any items </h3>");
//    let cartString = localStorage.getItem("cart");
//    let cart = JSON.parse(cartString);
//    if(cart==null || cart.length==0){
//        
//        console.log("Cart is empty !!");
//        $(".cart-items").html("(0)");
//        $(".cart-body").html("<h3>Cart does not have any items </h3>");
//        $(".checkout-btn").addClass('disabled');
//document.querySelector(".cart-body").innerHTML("<h3>Cart does not have any items </h3>");
//    }else{
//            
//    }
//}
//
//$(document).ready(function(){
//    updateCart();
//});
