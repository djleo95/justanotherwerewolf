$(document).ready(function() {
 $('#btn_create_new_room').on('click', function() {
   $.ajax({
     beforeSend: function(xhr){
       xhr.setRequestHeader('X-CSRF-Token',
         $('meta[name="csrf-token"]').attr('content'));
     },
     type: 'POST',
     url: '/rooms',
     data: {
     },
     success: function() {

     }
   });
 });
});