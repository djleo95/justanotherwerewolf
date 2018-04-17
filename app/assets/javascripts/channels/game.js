//= require cable
//= require_self
//= require_tree .

$(document).ready(function() {
  // this.App = {};
  // App.cable = ActionCable.createConsumer();
  App.messages = App.cable.subscriptions.create({
    channel: 'RoomsChannel',
    game_id: $('#room_id').attr('data-id')
  }, {
    received: function(data) {
      // $("#messages").removeClass('hidden')
      // return $('#messages').append(this.renderMessage(data));
      this.renderAction(data);
    },

    renderAction: function(data) {
      console.log(data);
      $('.start_game_div').load(location.href + ' .start_game_div');
      // $('#roleCallingModal').modal('show');
    }
  });



  // $('#playing_send_message').on('click', function() {
  //   console.log( $(this).attr('data-choose'))
  //   $.ajax({
  //     beforeSend: function(xhr){
  //       xhr.setRequestHeader('X-CSRF-Token',
  //         $('meta[name="csrf-token"]').attr('content'));
  //     },
  //     type: 'POST',
  //     url: '/rooms/create_message',
  //     data: {
  //       choose1: $(this).attr('data-choose1')
  //     }
  //   });
  // });

  $('#btn_role_calling_confirm').on('click', function() {
    // $.ajax({
    //   beforeSend: function(xhr){
    //     xhr.setRequestHeader('X-CSRF-Token',
    //       $('meta[name="csrf-token"]').attr('content'));
    //   },
    //   type: 'POST',
    //   url: '/rooms/role_calling',
    //   data: {
    //
    //   }
    // });
    console.log($('.role_calling_choose1').val());
    console.log($('.role_calling_choose2').val());
  })
});