//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require twitter/bootstrap
//= require taurus/area_input
//= require taurus/jquery.placeholder.min

$(function(){
	$('input, textarea').placeholder();

	$('.ui-autocomplete-input').live('click', function(){ 
		$('.ui-autocomplete').attr("class", "typeahead dropdown-menu");
	});

	$("[rel='popover']").popover();
	$("a.disabled").click(function(){return false});
});
