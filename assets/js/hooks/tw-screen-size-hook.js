const TwScreenSizeHook = {
  mounted() {
    const hook = this;
    const elem = hook.el;
    const opacityTimeout = elem.dataset.opacityTimeout;

    const widthElem = elem.querySelector("#tw-screen-size-width");
    const heightElem = elem.querySelector("#tw-screen-size-height");

    hook.updateTwScreenSizeDimensions = () => {
      if (opacityTimeout) {
        window.clearTimeout(hook.timeoutHandle);
        elem.classList.remove("opacity-0");
      }

      if (widthElem && heightElem) {
        widthElem.textContent = `${window.innerWidth}`;
        heightElem.textContent = `${window.innerHeight}`;
      }

      if (opacityTimeout) {
        hook.timeoutHandle = setTimeout(() => {
          elem.classList.add("opacity-0");
        }, opacityTimeout);
      }
    };

    // set initial width and height
    widthElem.textContent = `${window.innerWidth}`;
    heightElem.textContent = `${window.innerHeight}`;

    // show the screen size element
    elem.classList.remove("hidden");
    elem.classList.add("flex");

    // Start the fade in after a short delay to ensure the transition happens
    setTimeout(() => {
      elem.classList.remove("opacity-0");
    }, 10);

    if (opacityTimeout) {
      hook.timeoutHandle = setTimeout(() => {
        elem.classList.add("opacity-0");
      }, opacityTimeout);
    }

    window.addEventListener("resize", hook.updateTwScreenSizeDimensions);
  },
  destroyed() {
    const hook = this;

    window.clearTimeout(hook.timeoutHandle);
    window.removeEventListener("resize", hook.updateTwScreenSizeDimensions);
  },
};

export default TwScreenSizeHook;
