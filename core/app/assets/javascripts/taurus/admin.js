//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require twitter/bootstrap
//= require taurus/bootstrap
//= require taurus/area_input
//= require ckeditor/init

$(function(){
	$('.ui-autocomplete-input').live('click', function(){ 
		$('.ui-autocomplete').attr("class", "typeahead dropdown-menu");
	});
});
