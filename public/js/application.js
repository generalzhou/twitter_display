$(document).ready(function(){
  $.get(window.location.pathname + '/tweets', function(response){
    // $('#loading').hide();  
    $('.container').append(response);
  });
});


