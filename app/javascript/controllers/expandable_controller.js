import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.restoreState();
  }

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

    this.saveState();
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

    this.saveState();
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

    this.saveState();
  }

  saveState() {
    const dropdowns = this.element.querySelectorAll(".dropdown");
    const state = {};
    const accountId = this.element.getAttribute("data-account");

    dropdowns.forEach((dropdown) => {
      const id = dropdown.id.replace("_dropdown", "");
      const isOpen = dropdown.classList.contains("max-h-[80rem]");
      state[id] = isOpen;
    });

    localStorage.setItem(`dropdownState-${accountId}`, JSON.stringify(state));
  }

  restoreState() {
    const accountId = this.element.getAttribute("data-account");
    const state =
      JSON.parse(localStorage.getItem(`dropdownState-${accountId}`)) || {};

    Object.entries(state).forEach(([id, isOpen]) => {
      const targetElement = this.element.querySelector(`#${id}_dropdown`);
      const arrow = this.element.querySelector(`#${id}`);

      if (targetElement) {
        targetElement.classList.toggle("max-h-[80rem]", isOpen);
        targetElement.classList.toggle("max-h-0", !isOpen);
      }

      if (arrow) {
        arrow.classList.toggle("rotate-0", isOpen);
        arrow.classList.toggle("-rotate-90", !isOpen);
      }
    });
  }
}
