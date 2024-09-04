import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import * as bootstrap from 'bootstrap'
import "@rails/actiontext"

// Ensure Bootstrap's JavaScript components are re-initialized on each Turbo page load
document.addEventListener("turbo:load", function() {
  // Initialize all Bootstrap tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  });

  // Initialize all Bootstrap popovers
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  });

  // Initialize all Bootstrap modals
  var modalElementList = [].slice.call(document.querySelectorAll('.modal'))
  var modalList = modalElementList.map(function (modalEl) {
    return new bootstrap.Modal(modalEl)
  });

  // Initialize all carousels
  var carouselElementList = [].slice.call(document.querySelectorAll('.carousel'))
  var carouselList = carouselElementList.map(function (carouselEl) {
    return new bootstrap.Carousel(carouselEl)
  });
});
