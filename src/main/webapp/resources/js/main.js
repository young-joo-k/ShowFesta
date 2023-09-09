document.addEventListener("DOMContentLoaded", function () {
    var dropdowns = document.querySelectorAll(".dropdown");

    for (var i = 0; i < dropdowns.length; i++) {
        dropdowns[i].addEventListener("mouseover", function () {
            this.querySelector("ul").style.display = "block";
        });

        dropdowns[i].addEventListener("mouseout", function () {
            this.querySelector("ul").style.display = "none";
        });
    }
});