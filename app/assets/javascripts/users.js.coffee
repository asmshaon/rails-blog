$(document).on "ajax:success", "#popup_sign_in_form", (e, data, status, xhr) ->
  if data.success
    $('#sign_in_sign_up_modal').modal('hide')
    window.location.href = '/'
  else
    $("#popup_sign_in_error").removeClass("hide")
    $("#popup_sign_in_error").html(data.errors)

$(document).on "ajax:success", "#popup_sign_up_form", (e, data, status, xhr) ->
  if data.success
    $('#sign_in_sign_up_modal').modal('hide')
    window.location.href = '/'
  else
    $("#popup_sign_up_error").removeClass("hide")
    $("#popup_sign_up_error").html(data.errors)

$(document).on "hidden.bs.modal", "#sign_in_sign_up_modal", ->
  $("#popup_sign_in_error").addClass("hide")
  $("#popup_sign_up_error").addClass("hide")