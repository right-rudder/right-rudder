import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["repeatUntil", "select"];

  connect() {
    if (this.selectTarget.value != "no") {
      this.repeatUntilTarget.classList.remove("hidden");
    }
  }

  handleChange(event) {
    if (event.target.value != "no") {
      this.repeatUntilTarget.classList.remove("hidden");
    } else {
      this.repeatUntilTarget.classList.add("hidden");
    }
  }
}
