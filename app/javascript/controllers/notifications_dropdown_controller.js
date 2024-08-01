import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="profile-dropdown"
export default class extends Controller {
  static targets = ["notificationList"];

  toggle(event) {
    event.preventDefault();
    this.notificationListTarget.classList.contains("open")
      ? this.close()
      : this.open();
  }

  open() {
    this.notificationListTarget.classList.remove("opacity-0", "scale-0");
    this.notificationListTarget.classList.add(
      "open",
      "opacity-100",
      "scale-100"
    );
    document.addEventListener("click", this.closeOnClickOutside);
  }

  close() {
    this.notificationListTarget.classList.add("opacity-0", "scale-0");
    this.notificationListTarget.classList.remove(
      "open",
      "opacity-100",
      "scale-100"
    );
    document.removeEventListener("click", this.closeOnClickOutside);
  }

  closeOnClickOutside = (event) => {
    if (!this.element.contains(event.target)) {
      this.close();
    }
  };
}
