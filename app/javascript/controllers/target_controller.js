import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // Make target elements open in a new window
    const targets = this.element.querySelectorAll(".target");
    targets.forEach((target) => {
      target.setAttribute("target", "_blank");
    });
  }
}
