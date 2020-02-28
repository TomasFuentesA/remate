#filtro por provincia desde region
jQuery ->
  $('#realty_province_id').parent().hide()
  states = $('#realty_province_id').html()
  console.log($('#realty_region_id').html())
  $('#realty_region_id').change ->
    country = $('#realty_region_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label=#{escaped_country}]").html()
    console.log(options)
    if options
      $('#realty_province_id').html(options)
      $('#realty_province_id').parent().show()
    else
      $('#realty_province_id').empty()
      $('#realty_province_id').parent().hide()
#filtro por communa desde provincia
jQuery ->
  $('#realty_commune_id').parent().hide()
  states = $('#realty_commune_id').html()
  $('#realty_province_id').change ->
    country = $('#realty_province_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label=#{escaped_country}]").html()
    console.log(options)
    if options
      $('#realty_commune_id').html(options)
      $('#realty_commune_id').parent().show()
    else
      $('#realty_commune_id').empty()
      $('#realty_commune_id').parent().hide()
