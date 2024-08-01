import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tickets"
export default class extends Controller {
  static targets = ["form"];

  connect() {}

  submit() {
    this.element.requestSubmit();
  }
}
