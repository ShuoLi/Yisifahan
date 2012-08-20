// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$.ready(function(){
$("#myCart").click(function(){
	$('#wishlist').toggle("fast");
});


});

function add_item_in_wishlist_html(item_id){
	// display in wishlist
	var item_name = $("#item_box_"+item_id+" .item_code").text();
	var item_price = $("#item_box_"+item_id+" .item_price").text();
	var imagelink = $("#item_box_"+item_id+" .item_pic").attr("src");
	$('#wish_items').prepend("<span class='label remove-margin remove-border span2 pull-left'> #"+item_name+"<span class='pull-right'><i class='icon-remove'></i></span></span>");
	$('#wish_items').prepend("<a href='/items/"+item_id+"'><img src="+imagelink+"/></a>")
		
}
