function pokemonShowDoneHandler(response) {
  console.log(response)
  $('#x').html(response)
}

function pokemonShowSubmitHandler(event){
  console.log("pokemonShowSubmitHandler")
  event.preventDefault()

// Use JQuery to submit an AJAX get to the forms action
  $.ajax({
    method: "get",
    url: $(this).attr('action'),
    data: $(this).serialize()
  }).done(pokemonShowDoneHandler.bind(this))
}

$(document).ready(function() {
$('form#pokeform').on('submit', pokemonShowSubmitHandler)
  // $("#chooseyou").change(function(poke) {
  //   console.log(poke)
  //   document.forms['#pokeform'].submit();
  // })
});
