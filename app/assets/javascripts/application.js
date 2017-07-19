// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require ckeditor/init
//= require_tree .
/*effect cart*/
$(document).ready(function(){
    $("#1").click(function(){
        $("#123").slideToggle("slow");
    });
});
/*show hide input whenr create product*/
 // $(document).ready(function(){
 //      $("#show").click(function(){
 //          $("#sel1").hide();
 //          $("#ct").show();
 //      });
 //      $("#hide").click(function(){
 //          $("#sel1").show();
 //          $("#ct").hide();
 //      });
 //  });
/**Privew image when select file**/

  var loadImageFile = function(event) {
    var previewImage = document.getElementById('previewImage'); 
    previewImage.src = URL.createObjectURL(event.target.files[0]);};
/*************indenity quantity****************/
function cong(order_item_id) {
    console.log(order_item_id);
    var quantity_order_item = "quantity-" + order_item_id;
    var amount_order_item = "amount-" + order_item_id;
    var quantity = document.getElementById(quantity_order_item).value;
    var price_product = "price-" + order_item_id;
    var price = document.getElementById(price_product).innerHTML;
    document.getElementById(quantity_order_item).value = parseInt(quantity)+ 1;
    document.getElementById(amount_order_item).innerHTML = parseInt(quantity) * parseFloat(price) + parseFloat(price)+ '$';
  }
  function tru(order_item_id) {
    console.log(order_item_id);
    var quantity_order_item = "quantity-" + order_item_id;
    var amount_order_item = "amount-" + order_item_id;
    var quantity = document.getElementById(quantity_order_item).value;
    var price_product = "price-" + order_item_id;
    var price = document.getElementById(price_product).innerHTML;
    if(quantity > 1){
     document.getElementById(quantity_order_item).value = parseInt(quantity)- 1;
     document.getElementById(amount_order_item).innerHTML = parseInt(quantity - 2) * parseFloat(price) + parseFloat(price)+ '$';
    }

  }