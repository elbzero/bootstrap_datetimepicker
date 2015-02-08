class DateTimePicker
  formattingDefaults :
    dateFormat : 
      format : 'YYYY-MM-DD'
      view : 'M/D/YYYY' 

  time_convert : (time, from, to) ->
    if time
      if !moment(time, to, true).isValid()
        moment(time, from).format(to)
      else
        time
    else
      ''

  view_formatter : ($obj, format, view) ->
    thisObj = this
    $obj.each(->
      field = $(this)

      # Fix times for usage by user
      field.val(thisObj.time_convert(field.val(), format, view))

      $(this).closest('form').on('submit', ->
        # When we submit, switch back
        field.val(thisObj.time_convert(field.val(), view, format))
      )
    )

  formatDateType : (value, viewFormat) ->
    format = @formattingDefaults.dateFormat.format
    view = @formattingDefaults.dateFormat.view

    if viewFormat
      @time_convert(value, format, view)
    else
      @time_convert(value, view, format)

  addDateEvents : ->
    if !Modernizr.inputtypes.date
      # Formats
      format = 'YYYY-MM-DD'
      view = 'M/D/YYYY'

      # Update Values
      sel = $("input[type='date']")
      @view_formatter(sel, format, view)

      # Init Picker
      sel.datetimepicker({
        format: view,
        showClear: true,
        showTodayButton: true,
        icons : 
          time: 'fa fa-clock'
          date: 'fa fa-calendar'
          up: 'fa fa-arrow-up'
          down: 'fa fa-arrow-down'
          previous: 'fa fa-arrow-left'
          next: 'fa fa-arrow-right'
          today: 'fa fa-calendar'
          clear: 'fa fa-times-circle'
      })

    if !Modernizr.inputtypes.time
      # Formats
      format = 'HH:mm:ss.SSS'
      view = 'h:mm A'

      # Update Values
      sel = $("input[type='time']")
      @view_formatter(sel, format, view)

      # Init Picker
      sel.datetimepicker({
        format: view,
        showClear: true,
        showTodayButton: true,
        icons : 
          time: 'fa fa-clock'
          date: 'fa fa-calendar'
          up: 'fa fa-arrow-up'
          down: 'fa fa-arrow-down'
          previous: 'fa fa-arrow-left'
          next: 'fa fa-arrow-right'
          today: 'fa fa-calendar'
          clear: 'fa fa-times-circle'
      })

    if !Modernizr.inputtypes['datetime-local']
      # Formats
      format = 'YYYY-MM-DDTHH:mm'
      view = 'M/D/YYYY h:mm A'

      # Update Values
      sel = $("input[type='datetime-local']")
      @view_formatter(sel, format, view)

      # Init Picker
      sel.datetimepicker({
        format: view
      })

$ ->
  window.dateTimePicker = new DateTimePicker()
  dateTimePicker.addDateEvents()