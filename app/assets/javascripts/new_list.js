var ready;
ready = function () {
  var list_new = document.getElementById("list_new");
  var board_id = document.getElementById("board_id");

  list_new.addEventListener("keyup", function (event) {
    if (event.keyCode === 13) {
      event.preventDefault();

      $.ajaxSetup({
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
      });
      $.ajax({
        url: "/lists",
        type: "post",
        data: {
          list_new: JSON.stringify({
            title: list_new.value,
            board_id: board_id.value
          })
        }
      })

    }
  });
};

$(document).on('turbolinks:load', ready);