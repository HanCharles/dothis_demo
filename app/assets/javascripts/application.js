// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .
//= require ckeditor/init

// jQuery(function() {
// 	$("a.fancybox_index").fancybox({
// 		padding: 0
// 	});
// 	$("a.fancybox_related").click(function() {
// 		$("a.fancybox_index").trigger('click');
// 	});
// });

$(document).ready(function() {
	$("a.fancybox").fancybox({
		padding: 0,
		type: 'iframe',
		maxWidth: 1070,
		width: 1070,
		height: 1000,
		scrolling: 'auto'
	});
});

$(document).ready(function() {
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("slow", function() {
			$(this).remove();
		})
	}, 2000);
});