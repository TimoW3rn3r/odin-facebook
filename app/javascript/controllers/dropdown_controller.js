import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  static classes = ["change"]

  toggleClass() {
    this.contentTarget.classList.toggle(this.changeClass)
  }
}
