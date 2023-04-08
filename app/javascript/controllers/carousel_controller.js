import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="carousel"

export default class extends Controller {
  static targets = ["slides"];
  static classes = ["active"];

  currentIndex = 0;
  interval = 0;

  connect() {
    console.log("carousel connected")
    this.interval = setInterval(() => {
      const nextIndex = (this.currentIndex + 1) % this.slidesTargets.length;
      this.showSlide(nextIndex);
    }, parseInt(this.data.get("carouselInterval")));
  }

  disconnect() {
    clearInterval(this.interval);
  }

  showSlide(index) {
    this.slidesTargets.forEach((slide, i) => {
      if (i === index) {
        slide.classList.add(this.activeClass);
      } else {
        slide.classList.remove(this.activeClass);
      }
    });
    this.currentIndex = index;
  }
}
