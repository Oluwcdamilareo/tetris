# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


document.addEventListener('turbolinks:load', ->
  slides = document.getElementsByClassName("card");

  for slide in slides
    eventAdder(slide, 'click', flipSlide)
    eventAdder(slide, 'unclick', unflipSlide)
)


eventAdder = (el, ev, fn) ->
  if el.addEventListener
    el.addEventListener(ev, fn)
  else if el.attachEvent
    el.attachEvent('on' + ev, fn)

flipSlide = () ->
  if window.event.srcElement.parentElement.className == 'card'
    window.event.srcElement.parentElement.className = 'card flip'
  else if window.event.srcElement.parentElement.className == 'card flip'
    window.event.srcElement.parentElement.className = 'card'

unflipSlide = () ->
  if window.event.srcElement.parentElement.className == 'card flip'
    window.event.srcElement.parentElement.className = 'card'
  else
    window.event.srcElement.parentElement.className == 'card flip'
