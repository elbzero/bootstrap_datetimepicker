class DateTimePicker
  formattingDefaults :
    dateFormat : 
      format : 'YYYY-MM-DD'
      view : 'M/D/YYYY' 

  set_date : (sel, date) ->
    thisObj = this
    type = sel.attr('type')
    modern = false

    if type == "date"
      format = 'YYYY-MM-DD'
      view = 'M/D/YYYY'
      modern = Modernizr.inputtypes.date
    else if type == "time"
      format = 'HH:mm:ss.SSS'
      view = 'h:mm A'
      modern = Modernizr.inputtypes.time
    else if type = "datetime-local"
      format = 'YYYY-MM-DDTHH:mm'
      view = 'M/D/YYYY h:mm A'
      modern = Modernizr.inputtypes['datetime-local']

    if modern
      sel.val( moment(date).format( format ) )
    else
      sel.val(thisObj.time_convert(moment(date).format( view ), format, view))

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

  do_default_input_changes : (sel, format, view) ->
    @view_formatter(sel, format, view)
    sel.attr( "autocomplete", "off")
    sel.each ->

      default_current_date = $(this).data("default-current-date")
      keepOpen = if $(this).data("keep-open")? then $(this).data("keep-open") else true 

      # Init Picker
      $(this).datetimepicker({
        format: view,
        showClear: true,
        showTodayButton: true,
        keepOpen: keepOpen,
        useCurrent: default_current_date,
        icons : 
          time: 'fa fa-clock-o'
          date: 'fa fa-calendar'
          up: 'fa fa-arrow-up'
          down: 'fa fa-arrow-down'
          previous: 'fa fa-arrow-left'
          next: 'fa fa-arrow-right'
          today: 'fa fa-calendar-o'
          clear: 'fa fa-times-circle'
      })

  addDateEvents : ->
    if !Modernizr.inputtypes.date
      # Formats
      format = 'YYYY-MM-DD'
      view = 'M/D/YYYY'
      # Update Values
      sel = $("input[type='date']")
      this.do_default_input_changes( sel, format, view)

    if !Modernizr.inputtypes.time
      # Formats
      format = 'HH:mm:ss.SSS'
      view = 'h:mm A'
      # Update Values
      sel = $("input[type='time']")
      this.do_default_input_changes( sel, format, view)
      
    if !Modernizr.inputtypes['datetime-local']
      # Formats
      format = 'YYYY-MM-DDTHH:mm'
      view = 'M/D/YYYY h:mm A'
      # Update Values
      sel = $("input[type='datetime-local']")
      this.do_default_input_changes( sel, format, view)

$ ->
  window.dateTimePicker = new DateTimePicker()
  dateTimePicker.addDateEvents()