import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ['Thriller', 'Adventure', 'Fantasy', 'Comedy'],
    typeSpeed: 75,
    loop: true
  });
}

export { loadDynamicBannerText }
