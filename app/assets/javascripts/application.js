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


	$(".remove_wish_item").click(function(){
		var s = this.id.toString();
		var item_id = s.split('_')[1];
		var wishlist = $.cookie('wishlist');
		wishlist = wishlist.split(',');
		//remove one element from the wishlist
		while (wishlist.indexOf(item_id) !== -1) {
			wishlist.splice(wishlist.indexOf(item_id), 1);
		}
	
		$.cookie('wishlist', wishlist, { expires: 99 });

		$('#interest_'+item_id).removeClass('btn-danger').addClass('btn-success');
		$('#showInterest_'+item_id).removeClass('btn-danger').addClass('btn-success');
		$('#wishItem_'+item_id).html("");
	});

});

