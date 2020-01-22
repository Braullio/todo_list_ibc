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

  if (e.target.id.includes("ul")) {
    e.target.appendChild($code_html);
  } else {
    $lister.parentElement.appendChild($code_html);
  }
}