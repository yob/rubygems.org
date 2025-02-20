import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fieldset"]
  static values = {
    trustedPublisher: String
  }

  trustedPublisherValueChanged() {
    var value = this.trustedPublisherValue

    this.fieldsetTargets.forEach((target) => {
      const key = target.dataset.key
      if (key === value) {
        target.classList.remove("t-item--hidden")
        target.setAttribute("disabled", false)
      } else {
        target.classList.add("t-item--hidden")
        target.setAttribute("disabled", true)
      }
    })
  }

  toggleSelector(evt) {
    var value = evt.target.value;
    this.trustedPublisherValue = value;
  }
}
