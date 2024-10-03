import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["country", "state", "city"];

  connect() {}

  changeCountry() {
    const selectedCountry = this.countryTarget.value;

    // Fetch states based on selected country
    fetch(`/locations/states?country=${encodeURIComponent(selectedCountry)}`)
      .then((response) => response.json())
      .then((states) => this.updateStateOptions(states))
      .catch((error) => console.error("Error fetching states:", error));
  }

  updateStateOptions(states) {
    this.stateTarget.innerHTML = "";
    this.cityTarget.innerHTML = "";

    const blankOption = document.createElement("option");
    blankOption.value = "";
    blankOption.textContent = "Select a state";
    this.stateTarget.appendChild(blankOption);

    states.forEach((state) => {
      const option = document.createElement("option");
      option.value = state.code;
      option.textContent = state.name;
      this.stateTarget.appendChild(option);
    });
  }

  changeState() {
    const selectedCountry = this.countryTarget.value;
    const selectedState = this.stateTarget.value;

    fetch(
      `/locations/cities?country=${encodeURIComponent(
        selectedCountry
      )}&state=${encodeURIComponent(selectedState)}`
    )
      .then((response) => response.json())
      .then((cities) => this.updateCityOptions(cities))
      .catch((error) => console.error("Error fetching cities:", error));
  }

  updateCityOptions(cities) {
    this.cityTarget.innerHTML = "";

    const blankOption = document.createElement("option");
    blankOption.value = "";
    blankOption.textContent = "Select a city";
    this.cityTarget.appendChild(blankOption);

    cities.forEach((city) => {
      const option = document.createElement("option");
      option.value = city.name;
      option.textContent = city.name;
      this.cityTarget.appendChild(option);
    });
  }
}
