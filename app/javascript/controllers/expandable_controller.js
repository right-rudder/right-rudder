import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(e) {
    const targetElement = this.element.querySelector(
      `#${e.target.id}_dropdown`
    );

    if (targetElement) {
      targetElement.classList.toggle("max-h-[80rem]");
      targetElement.classList.toggle("max-h-0");
    }

    e.target.classList.toggle("-rotate-90");
    e.target.classList.toggle("rotate-0");
  }

  expandAll() {
    const dropdowns = this.element.querySelectorAll(".dropdown");
    dropdowns.forEach((dropdown) => {
      dropdown.classList.add("max-h-[80rem]");
      dropdown.classList.remove("max-h-0");
    });

    const arrows = this.element.querySelectorAll(".arrow");
    arrows.forEach((arrow) => {
      arrow.classList.add("rotate-0");
      arrow.classList.remove("-rotate-90");
    });
  }

  collapseAll() {
    const dropdowns = this.element.querySelectorAll(".dropdown");
    dropdowns.forEach((dropdown) => {
      dropdown.classList.add("max-h-0");
      dropdown.classList.remove("max-h-[80rem]");
    });

    const arrows = this.element.querySelectorAll(".arrow");
    arrows.forEach((arrow) => {
      arrow.classList.add("-rotate-90");
      arrow.classList.remove("rotate-0");
    });
  }
}
