# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Morris.Line
    element: 'records_chart'
    data: $('#records_chart').data('records')
    xkey: 'date'
    ykeys: ['santa_cruz', 'north_bay']
    labels: ['Santa Cruz', 'North Bay']

jQuery ->
  Morris.Line
    element: 'records_chart2'
    data: $('#records_chart').data('records')
    xkey: 'date'
    ykeys: ['santa_cruz', 'north_bay', 'peninsula', 'east_bay', 'south_bay', 'san_francisco']
    labels: ['Santa Cruz', 'North Bay', 'Peninsula', 'East Bay', 'South Bay', 'San Francisco']