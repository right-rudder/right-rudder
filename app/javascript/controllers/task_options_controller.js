import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="task-options"
export default class extends Controller {
  static targets = ["menu"];

  open() {
    this.menuTarget.classList.remove("max-w-0", "max-h-0");
    this.menuTarget.classList.add("open", "max-w-72", "max-h-48");
    setTimeout(() => {
      document.addEventListener("click", this.closeOnClickOutside);
    }, 0);
  }

  close() {
    this.menuTarget.classList.add("max-w-0", "max-h-0");
    this.menuTarget.classList.remove("open", "max-w-72", "max-h-48");
    document.removeEventListener("click", this.closeOnClickOutside);
  }

  closeOnClickOutside = (event) => {
    if (event.target != this.menuTarget) {
      this.close();
    }
  };
}
