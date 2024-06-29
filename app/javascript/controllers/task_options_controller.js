import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="task-options"
export default class extends Controller {
  static targets = ["menu"];

  open() {
    this.menuTarget.classList.remove("translate-x-full");
    this.menuTarget.classList.add("open", "translate-x-0");
    setTimeout(() => {
      document.addEventListener("click", this.closeOnClickOutside);
    }, 0);
  }

  close() {
    this.menuTarget.classList.add("translate-x-full");
    this.menuTarget.classList.remove("open", "translate-x-0");
    document.removeEventListener("click", this.closeOnClickOutside);
  }

  closeOnClickOutside = (event) => {
    if (event.target != this.menuTarget) {
      this.close();
    }
  };
}
