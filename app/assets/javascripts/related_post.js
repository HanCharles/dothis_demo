//= require jquery
//= require jquery_ujs
//= require fancybox
//= require masonry/jquery.masonry

jQuery(function() {
	$("a.fancybox").fancybox({
		padding: 0
		// parent: 'body',
		// type: 'ajax',
	});
});

$(function () {
	var $container = $('.posts');
	$container.imagesLoaded(function(){
		$container.masonry({
			itemSelector: '.box',
			isFitWidth: true
		});
	});
});