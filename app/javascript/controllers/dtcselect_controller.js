import { Controller } from "@hotwired/stimulus"

console.log("loading dtcselect");

export default class extends Controller {
  static targets = ["selector", "selected"]

  connect() {
    console.log("connected assetselect_controller")
    this.expose();
  }

  update() {
    console.log("update selector " + this.selectorTarget.value)
    this.expose();
  }

  expose() {
    console.log("expose");
    console.log("selector " + this.selectorTarget.value)
    let name = this.selectorTarget.value
    //console.log("target count: " + this.selectedTargets.length() );
    this.selectedTargets.forEach((element, index) => {
      console.log(element);
      console.log(element.getAttribute("name"));
      let show = element.getAttribute("name") != name
      element.hidden = show;
      element.querySelectorAll("input").forEach((x, idx) => {
	x.disabled = show;
      })
    })
  }
}
