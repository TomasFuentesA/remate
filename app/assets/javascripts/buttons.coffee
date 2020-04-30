# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("a[data-remote].btn-danger").on "ajax:success", (event) ->
    alert "La propiedad ha sido eliminada con éxito."
