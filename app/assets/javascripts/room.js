$(document).ready(function() {
  $('#room_has_pass_checkbox').on('click', function(){
    if($(this).is(":checked")) {
      $('#new_room_password').removeClass('d-none')
    } else {
      $('#new_room_password').addClass('d-none')
    }
  });


 $('#btn_create_new_room').on('click', function() {
   $.ajax({
     beforeSend: function(xhr){
       xhr.setRequestHeader('X-CSRF-Token',
         $('meta[name="csrf-token"]').attr('content'));
     },
     type: 'POST',
     url: '/rooms',
     data: {
       capacity: $('#new_room_capacity').val(),
       has_pass: $('#room_has_pass_checkbox').is(":checked"),
       password: $('#new_room_password').val(),
     },
     success: function() {
       $('#room_list_container').load(location.href + ' #room_list');
     }
   });

   $('#createNewRoomModal').modal('toggle');
 });
});