import flatpickr from "flatpickr";

const initFlatpickr = () => {


    const startTimeInput = document.getElementById('instance_start_time');

    if (startTimeInput) {
    // const unavailableDates = JSON.parse(document.querySelector('#plane-booking-dates').dataset.unavailable)

    flatpickr(startTimeInput, {
      enableTime: true,
      minDate: "today",
      // disable: unavailableDates,
      dateFormat: "Y-m-d H:i",
    });

    console.log('flatpickr is working')

    };

    const dateInput = document.getElementById('experience_date');

    if (dateInput) {
    // const unavailableDates = JSON.parse(document.querySelector('#plane-booking-dates').dataset.unavailable)

    flatpickr(dateInput, {
      enableTime: true,
      minDate: "today",
      // disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    console.log('flatpickr is (still) working')

    };
}

export { initFlatpickr }
