$(document).ready(function() {
  $('.btn_join_room').on('click', function() {
    alert('hey');
    var user_id = $(this).attr("data-user-id");
    var game_id = $(this).attr("data-game-id");
    console.log(user_id + ', ' + game_id);
    $.ajax({
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
      },
      type: 'POST',
      url: '/rooms',
      data: {
        user_id: user_id,
        game_id: game_id
      }
    });
  });
});