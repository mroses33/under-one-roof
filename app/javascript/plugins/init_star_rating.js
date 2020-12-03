import "jquery-bar-rating";

const initStarRating = () => {
  $('.rating-review').barrating({
      theme: 'css-stars'
    });
}

export { initStarRating };
