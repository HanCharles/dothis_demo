//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry

$(function () {
	var $container = $('.posts');
	$container.imagesLoaded(function(){
		$container.masonry({
			itemSelector: '.box',
			isFitWidth: true
		});
	});
});