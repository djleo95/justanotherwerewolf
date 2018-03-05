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
      $("#messages").removeClass('hidden')
      return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
      console.log(data)
      return "<p> <b>" + data.user + ": </b>" + data.choose1 + "</p>";
    }
  });


  $('#playing_send_message').on('click', function() {
    console.log( $(this).attr('data-choose'))
    $.ajax({
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
      },
      type: 'POST',
      url: '/rooms/create_message',
      data: {
        choose1: $(this).attr('data-choose1')
      }
    });
  });
});