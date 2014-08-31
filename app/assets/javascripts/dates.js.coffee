$ ->
  time_convert = (time, from, to) ->
    if time
      if !moment(time, to, true).isValid()
        moment(time, from).format(to)
      else
        time
    else
      ''

  view_formatter = ($obj, format, view) ->
    $obj.each(->
      field = $(this)

      # Fix times for usage by user
      field.val(time_convert(field.val(), format, view))

      $(this).closest('form').on('submit', ->
        # When we submit, switch back
        field.val(time_convert(field.val(), view, format))
      )
    )

  if !Modernizr.inputtypes.date
    # Formats
    format = 'YYYY-MM-DD'
    view = 'M/D/YYYY'

    # Update Values
    sel = $("input[type='date']")
    view_formatter(sel, format, view)

    # Init Picker
    sel.datetimepicker({
      format: view,
      pickTime: false
    })

  if !Modernizr.inputtypes.time
    # Formats
    format = 'HH:mm:ss.SSS'
    view = 'h:mm A'

    # Update Values
    sel = $("input[type='time']")
    view_formatter(sel, format, view)

    # Init Picker
    sel.datetimepicker({
      format: view,
      pickDate: false
    })

  if !Modernizr.inputtypes['datetime-local']
    # Formats
    format = 'YYYY-MM-DDTHH:mm'
    view = 'M/D/YYYY h:mm A'

    # Update Values
    sel = $("input[type='datetime-local']")
    view_formatter(sel, format, view)

    # Init Picker
    sel.datetimepicker({
      format: view
    })
