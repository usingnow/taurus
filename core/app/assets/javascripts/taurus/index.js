//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require twitter/bootstrap
//= require taurus/area_input

$(function(){
  jQuery.ajax({
  	url: '/index/cart_product_line_items',
    type: 'GET',
    dataType: 'json',
    success: function(data){
      jQuery('#cart_amount').html(data.cart.total_amount);
    }
  }); 

  $("a.disabled").click(function(){return false});
});