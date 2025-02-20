import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "fieldset"]

  connect() {
    this.toggleSelector("github");
  }

  selectTargetConnected(el) {
    el.addEventListener("change", (evt) => this.toggleSelector(evt.target.value))
  }

  toggleSelector(value) {
    this.fieldsetTargets.forEach((target) => {
      const key = target.dataset.key
      if (key === value) {
        target.classList.remove("t-item--hidden")
      } else {
        target.classList.add("t-item--hidden")
      }
    })
  }
}
