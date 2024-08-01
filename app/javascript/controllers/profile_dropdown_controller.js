import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="profile-dropdown"
export default class extends Controller {
  static targets = ["menu"];

  toggle(event) {
    event.preventDefault();
    this.menuTarget.classList.contains("open") ? this.close() : this.open();
  }

  open() {
    this.menuTarget.classList.remove("opacity-0", "scale-0");
    this.menuTarget.classList.add("open", "opacity-100", "scale-100");
    document.addEventListener("click", this.closeOnClickOutside);
  }

  close() {
    this.menuTarget.classList.add("opacity-0", "scale-0");
    this.menuTarget.classList.remove("open", "opacity-100", "scale-100");
    document.removeEventListener("click", this.closeOnClickOutside);
  }

  closeOnClickOutside = (event) => {
    if (!this.element.contains(event.target)) {
      this.close();
    }
  };
}
