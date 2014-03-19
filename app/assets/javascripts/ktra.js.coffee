jQuery ->
  $(document).on "keypress", "input:not(.allow-submit)", (event) -> event.which != 13
