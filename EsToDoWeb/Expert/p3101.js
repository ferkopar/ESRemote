var size = [window.width, window.height];  //public variable
$(window).resize(function () {
    window.resizeTo(size[0], size[1]);
});