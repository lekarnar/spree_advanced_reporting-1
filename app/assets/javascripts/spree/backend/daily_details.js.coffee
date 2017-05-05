DailyDetails = {
  init: ->
    $('[data-details]').click(DailyDetails.showDetails)

  showDetails: (e) ->
    target = $(e.currentTarget).attr('data-details')
    $('#' + target).toggle()
    return false;
}

$(DailyDetails.init)