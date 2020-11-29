import flatpickr from "flatpickr";

const initFlatpickr = () => {


    const startTimeInput = document.getElementById('booking_start_time');

    if (startTimeInput) {
    const unavailableDates = JSON.parse(document.querySelector('#experience-booking-dates').dataset.unavailable)

    flatpickr(startTimeInput, {
      enableTime: true,
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d H:i",
    });

    console.log('flatpickr is working')

    };

    const startTimeInstance = document.getElementById('instance_start_time');

        if (startTimeInstance) {
        // const unavailableDates = JSON.parse(document.querySelector('#plane-booking-dates').dataset.unavailable)

        flatpickr(startTimeInstance, {
          enableTime: true,
          minDate: "today",
          // disable: unavailableDates,
          dateFormat: "Y-m-d H:i",
        });

        console.log('flatpickr is working')

        };
}

export { initFlatpickr }
