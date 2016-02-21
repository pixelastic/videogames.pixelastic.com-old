$(document).ready(() => {
  // Lazy load images when the got into the viewport
  let lazyLoadedCards = $('.c-card--image[data-lazyload]');
  function onVisible(card) {
    let $card = $(card);
    let imageUrl = $card.data('lazyload');
    $card.css('backgroundImage', `url(${imageUrl}`);
  }

  _.each(lazyLoadedCards, (card) => {
    inViewport(card, onVisible);
  });
});
