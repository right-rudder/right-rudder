import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "overdueTickets",
    "dueTodayTickets",
    "dueTomorrowTickets",
    "dueLaterThisWeekTickets",
    "dueNextWeekTickets",
    "dueLaterWithinAMonthTickets",
    "dueLaterTickets",
    "noDueDateTickets",
    "completedTickets",
  ];

  toggle(e) {
    const targetId = e.target.id.concat("Target");
    const targetElement = this[targetId];

    if (targetElement) {
      targetElement.classList.toggle("max-h-[80rem]");
      targetElement.classList.toggle("max-h-0");
    }

    e.target.classList.toggle("-rotate-90");
    e.target.classList.toggle("rotate-0");
  }

  expandAll() {
    this.constructor.targets.forEach((target) => {
      const targetElement = document.getElementById(target);
      if (targetElement) {
        const element = this[`${target}Target`];
        element.classList.add("max-h-[80rem]");
        element.classList.remove("max-h-0");

        targetElement.classList.remove("-rotate-90");
        targetElement.classList.add("rotate-0");
      }
    });
  }

  collapseAll() {
    this.constructor.targets.forEach((target) => {
      const targetElement = document.getElementById(target);
      if (targetElement) {
        const element = this[`${target}Target`];
        element.classList.remove("max-h-[80rem]");
        element.classList.add("max-h-0");

        targetElement.classList.add("-rotate-90");
        targetElement.classList.remove("rotate-0");
      }
    });
  }
}
