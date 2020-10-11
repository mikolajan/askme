document.addEventListener("DOMContentLoaded", function () {
    $(function () {
        $('#ask-button').click(function () {
            $('#ask-form').slideToggle(300);
            return false;
        });
    });
})
