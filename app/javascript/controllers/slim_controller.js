import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

// Connects to data-controller="slim"
export default class extends Controller {
	static targets = ["number", "price", "size", "id"];
	connect() {
		new SlimSelect({
			select: this.numberTarget
		})
	}

	handleChange(event) {
		// const nextInput = currentInput.nextElementSibling;
		const q = event.target.value;
		const end_poin = "/containers/search/" + q;
		fetch(end_poin)
			.then(response => {
				if (!response.ok) {
					throw new Error("Network response was not ok");
				}
				return response.json();
			})
			.then(data => {
				// console.log(data);
				this.priceTarget.value = data.price;
				this.sizeTarget.value = data.size;
				this.idTarget.value = data.id;
			})
			.catch(error => {
				console.error("There was a problem with your fetch operation:", error);
			});

	}
}
