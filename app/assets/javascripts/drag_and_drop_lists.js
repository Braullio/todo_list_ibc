function allowDrop(e) {
  e.preventDefault();
}

function drag(e) {
  e.dataTransfer.setData("element", e.target.id);
}

function drop(e) {
  e.preventDefault();
  var $data = e.dataTransfer.getData("element");
  var $code_html = document.getElementById($data);
  var $lister = document.getElementById(e.target.id);
  var $count = $lister.getElementsByTagName('li').length;
  
  if (e.target.id.includes("li")) {
    $card = $lister.parentElement.appendChild($code_html);
    
    $count = $lister.parentElement.getElementsByTagName('li').length;
    $count -= 1;
    $card.id = ($lister.parentElement.id + "li" + $count);

    var $list_id = $lister.parentElement.getAttribute("list");
    var $card_id = $card.getAttribute("card");

  } else {
    $card = e.target.appendChild($code_html);

    $count = $code_html.getElementsByTagName('li').length;
    $card.id = ($lister.id + "li" + $count);

    var $list_id = $lister.getAttribute("list");
    var $card_id = $card.getAttribute("card");

  }

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  
  $.ajax({
    url: "/cards/update_list", type: "post",
    data: { update_list: JSON.stringify({ list_id: $list_id, card_id: $card_id }) }
  }); 

}