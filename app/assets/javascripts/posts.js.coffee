# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#show_images').find('img').css({'width': '50px', 'height': '50px'});
$('.clearing-thumbs li:first').css({'float': 'none', 'margin-bottom': '10px'})
$('#show_images').find('img:first').css({'width': '350px','height': '350px','border': '1px #DDDDDD solid'});

$('#make_offer_button_top').click ->
  $('#comment_content').focus();

#$('#post_index_panel').hover ->
#  $('.post-info-display').fadeIn();
#  $('.post-info-display').fadeOut();

