import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tickets"
export default class extends Controller {
  submit() {
    this.element.requestSubmit();
  }
}
