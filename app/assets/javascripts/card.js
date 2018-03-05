$(document).ready(function(){
  function setCurrentCardNumber(value) {
    var new_value = parseInt($('#current_card_number').text()) + value;
    $('#current_card_number').text(new_value);
  };

  $('.clickable-card').on('click', function() {
    var card= $(this).parent();
    if(card.attr('data-active') === 'true') {
      $(this).attr('src', 'https://i.imgur.com/BqerieU.png');
      card.attr('data-active', false);
      setCurrentCardNumber(-1);
    } else {
      $(this).attr('src', 'https://i.imgur.com/31kGJp1.png');
      card.attr('data-active', true);
      switch(card.attr('data-title')){
        case "Seer":
          break;
        case "Hunter":
          break;
        default:
      }
      setCurrentCardNumber(1);
    }
  });

  $('#btn_pick_card_confirm').on('click', function() {
    var array = [];
    var direct_url = '/rooms/' + $(this).attr('data-room-id');
    $('.card').each(function() {
      if($(this).attr('data-active') === 'true') {
        array.push($(this).attr('data-id'));
      }
    });
    $.ajax({
      beforeSend: function(xhr){
        xhr.setRequestHeader('X-CSRF-Token',
          $('meta[name="csrf-token"]').attr('content'));
      },
      type: 'PUT',
      url: direct_url,
      data: {
        card: array.valueOf()
      },
      success: function(){
        $('#for_room_leader').hide();
        $('#playing').removeClass('d-none');
      }
    });
  });
});