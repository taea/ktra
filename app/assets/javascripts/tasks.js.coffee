$ ->
  $(":text").focus ->
    $(this).next().hide()
  $(":text").focusout ->
    $(this).next().show()

