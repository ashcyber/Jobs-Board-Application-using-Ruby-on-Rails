
window.addEventListener("load", function(){
  var load_screen = document.getElementById("load_screen"); 
  document.body.removeChild(load_screen)
});

$(function () {
  
  
  
  $("#navbarToggle").blur(function (event) {
    var screenWidth = window.innerWidth;
      if (screenWidth < 768) {
        $("#collapse-nav-bar").collapse('hide');
      }
  });
    
  
  
  setTimeout(function() {
    $('#message_box').fadeOut('fast');
  }, 5000); // <-- time in milliseconds
    
  
  
  $("#navbarToggle").blur(function (event) {
    var screenWidth = window.innerWidth;
      if (screenWidth < 768) {
        $("#collapsed-bar").collapse('hide');
      }
  });

  
  // Highlight the top nav as scrolling occurs
   $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });

  // Offset for Main Navigation
  $('#mainNav').affix({
      offset: {
          top: 100
      }
  })


   $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
          $('#back-to-top').fadeIn();
      } else {
          $('#back-to-top').fadeOut();
      }
  });
  
  
  // scroll body to 0px on click
  $('#back-to-top').click(function () {
      $('#back-to-top').tooltip('hide');
      $('body,html').animate({
          scrollTop: 0
      }, 800);
      return false;
  });
  
  $('#back-to-top').tooltip('show');

  
}); 

$(document).on('click', '.browse', function(){
  var file = $(this).parent().parent().parent().find('.file');
  file.trigger('click');
});


$(document).on('change', '.file', function(){
  $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
});