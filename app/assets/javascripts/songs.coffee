$ ->
  
  $(document).on 'click', '.jp-play', (evt) ->
    $.ajax '/play',
      type: 'GET'
      dataType: 'script'
      data: {
        id: $("#song_id").html()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("play OK!")


  $(document).on 'click', '.jp-stop', (evt) ->
    $.ajax '/stop',
      type: 'GET'
      dataType: 'script'
      data: {
        id: $("#song_id").html()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("stop OK!")