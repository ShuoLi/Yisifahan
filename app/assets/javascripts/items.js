$.ready(function(){
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
