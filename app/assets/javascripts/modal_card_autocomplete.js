$('#modal_card').on('show.bs.modal', function (e) {
  var listId = $(e.relatedTarget).data('list-id');
  $(e.currentTarget).find('select[name="list_id"]').val(listId);

  var listId = $(e.relatedTarget).data('card-id');
  $(e.currentTarget).find('input[name="card_id"]').val(listId);

  var listId = $(e.relatedTarget).data('card-id');
  $(e.currentTarget).find('input[name="card_id_del"]').val(listId);

  var listName = $(e.relatedTarget).data('card-title');
  $(e.currentTarget).find('input[name="title"]').val(listName);

  var boardId = $(e.relatedTarget).data('card-description');
  $(e.currentTarget).find('input[name="description"]').val(boardId);
});

$('#modal_card_new').on('show.bs.modal', function (e) {
  var listId = $(e.relatedTarget).data('list-id');
  $(e.currentTarget).find('input[name="list_id"]').val(listId);
});